clear;close all;
folderTest='./Set11/';
savepath ='./peak10';
addpath('utilities');
isSaveResult = 0;
peak = 10;
useGPU      = 1
pauseTime   = 1;
showResult = 0;

    label_rd = h5read(['./output_N' num2str(peak) '.h5'], '/label');
    %%% read images
    ext         =  {'*.jpg','*.png','*.tif'};
    filePaths   =  [];
    
    for i = 1 : length(ext)
        filePaths = cat(1,filePaths, dir(fullfile(folderTest,ext{i})));
    end

    for i = 1:length(filePaths)
        %%% read images
        label = imread(fullfile(folderTest,filePaths(i).name));
        [H,W,Z]=size(label);
        [~,nameCur,extCur] = fileparts(filePaths(i).name);
        disp([num2str(i),'    ',filePaths(i).name,'    ',num2str(peak)]);
        if(size(label,3)>1)
            label = rgb2ycbcr(label);
            label=label(:, :, 1);
        end
        im_label = label;
        im_label = double(im_label(:, :, 1));
        
        [hei,wid] = size(im_label);
        Q = max(max(im_label)) / peak;
        ima_lambda = im_label / Q;
        ima_lambda(ima_lambda == 0) = min(min(ima_lambda(ima_lambda > 0)));
        ima_nse = poissrnd(ima_lambda);
        input = ima_nse;
        tic
        output = label_rd(:,:,1,i);
        timeCur = toc;      
        %%% calculate PSNR
        sprintf('Noisy PSNR = %f',psnr(double(output), Q*ima_lambda, 255))
        PSNRCur = psnr(double(output),Q*ima_lambda,255);
        SSIMCur = ssim(double(output) / 255, Q*ima_lambda / 255);
        PSNRs(num/5000,i)= PSNRCur;
        SSIMs(num/5000,i) = SSIMCur;
        time(num/5000,i) = timeCur;
        
        if showResult
            
            figure(4000+i),imshow(cat(2,double(label),double(output)),[]);
            drawnow;
            pause(pauseTime)
            
        end

        if isSaveResult
            imwrite(uint8(output),fullfile(savepath,[nameCur '_recover_VST_N' num2str(peak) '.bmp']));
        end
        
    end