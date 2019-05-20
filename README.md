# VST-Net
The Code is created based on the method described in the following paper:
VST-Net: Variance-stabilizing Transformation Inspired Network for Poisson Denoising 

## Introduction 
Inspired by the traditional VST scheme, we propose a novel Poisson denoising model based on convolutional neural network, called variance-stabilizing transform network (VST-Net). VST-Net inherits the structures and strengths of the traditional VST scheme via optimizing the nonlinear transformation by means of network design and supervised learning. The whole VST-Net network contains three sub-networks. The first and third sub-networks simulate the forward and inverse Anscombe transforms, respectively. Meanwhile, the second sub-network is devoted to playing the role of approximate Gaussian denoising. Joint learning strategy and two-stage progressive learning strategy are exploited to investigate the rationality and strength of the VST scheme. 

### Fig.1(a)
![repeat-VST_Net](https://github.com/yqx7150/VST-Net/blob/master/fig/fig1.png)
 
 The network architecture of the proposed VST-Net. It consists of three major components: SubNet1, SubNet2 and SubNet3. “C”, “B” and “R” stand for the Conv, BN and ReLU layers, respectively. For visual convenience, only one image from the 32 feature maps/images in the output of SubNet1 and SubNet2 is shown.
### Fig.1(b)
![repeat-VST_Net](https://github.com/yqx7150/VST-Net/blob/master/fig/fig2.png)

A special case of Fig. 3. The channel number of the last Conv layer at SubNet1 and SubNet2 is 1.

## Requirements and Dependencies
    MATLAB R2015b
    Cuda-8.0
    MatConvNet

## How to test
"./Demo_test_VST_Net.m" is the demo of M2DAEP for TEST.

## paper
Minghui Zhang, Fengqin Zhang, Qiegen Liu*, Shanshan Wang*, VST-Net: Variance-stabilizing Transformation Inspired Network for Poisson Denoising, J. Vis. Commun. Image R., 62: 12-22, 2019. 
https://www.sciencedirect.com/science/article/pii/S1047320319301439
