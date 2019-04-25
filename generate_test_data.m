clear; clc;
addpath('utilities');
folderTest = './Set11/';
savepath = 'test11_10.h5';
filePaths   =  [];

count = 0;
peak = 10;
ext         =  {'*.jpg','*.png','*.tif'};

for i = 1 : length(ext)
    filePaths = cat(1,filePaths, dir(fullfile(folderTest,ext{i})));
end

for i = 1:length(filePaths)
    image = imread(fullfile(folderTest,filePaths(i).name));
    if (size(image,3)>1)
        image = rgb2ycbcr(image);
    end
    im_label = image;
    
    im_label = double(im_label(:, :, 1));
    [hei,wid] = size(im_label);
    
    
    %%% Apply poisson noise
    Q = max(max(im_label)) / peak;   % reducing factor of underlying luminosity
    ima_lambda = im_label / Q;
    ima_lambda(ima_lambda == 0) = min(min(ima_lambda(ima_lambda > 0)));
    ima_nse = poissrnd(ima_lambda);
    im_input_1 = ima_nse;
    %%%Apply ones
    im_input_2 = ones(size(im_input_1));
    im_input = cat(3,im_input_1,im_input_2);
    
    count = count + 1;
    data(:, :, :, count) = im_input;
    label(:, :, 1, count) = im_label;
end

%% writing to HDF5
chunksz = 11;
created_flag = false;
totalct = 0;

for batchno = 1:floor(count/chunksz)
    last_read = (batchno-1)*chunksz;
    batchdata(:,:,1,:) = data(:,:,1,last_read+1:last_read+chunksz);
    batchdata(:,:,2,:) = data(:,:,2,last_read+1:last_read+chunksz);
    batchlabs = label(:,:,1,last_read+1:last_read+chunksz);
    
    startloc = struct('dat',[1,1,1,totalct+1], 'lab', [1,1,1,totalct+1]);
    curr_dat_sz = store2hdf5(savepath, batchdata, batchlabs, ~created_flag, startloc, chunksz);
    created_flag = true;
    totalct = curr_dat_sz(end);
end
h5disp(savepath);
