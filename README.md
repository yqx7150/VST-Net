# VST-Net
The Code is created based on the method described in the following paper:
VST-Net: Variance-stabilizing Transformation Inspired Network for Poisson Denoising 

## Introduction 
Inspired by the traditional VST scheme, we propose a novel Poisson denoising model based on convolutional neural network, called variance-stabilizing transform network (VST-Net). VST-Net inherits the structures and strengths of the traditional VST scheme via optimizing the nonlinear transformation by means of network design and supervised learning. The whole VST-Net network contains three sub-networks. The first and third sub-networks simulate the forward and inverse Anscombe transforms, respectively. Meanwhile, the second sub-network is devoted to playing the role of approximate Gaussian denoising. Joint learning strategy and two-stage progressive learning strategy are exploited to investigate the rationality and strength of the VST scheme. 
