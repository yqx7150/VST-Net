# VST-Net
The Code is created based on the method described in the following paper:
VST-Net: Variance-stabilizing Transformation Inspired Network for Poisson Denoising 


## Introduction 
Inspired by the traditional VST scheme, we propose a novel Poisson denoising model based on convolutional neural network, called variance-stabilizing transform network (VST-Net). VST-Net inherits the structures and strengths of the traditional VST scheme via optimizing the nonlinear transformation by means of network design and supervised learning. The whole VST-Net network contains three sub-networks. The first and third sub-networks simulate the forward and inverse Anscombe transforms, respectively. Meanwhile, the second sub-network is devoted to playing the role of approximate Gaussian denoising. Joint learning strategy and two-stage progressive learning strategy are exploited to investigate the rationality and strength of the VST scheme. 

### Fig.1
<div align=center><img src="https://github.com/yqx7150/VST-Net/blob/master/fig/fig1.png" alt="Fig.1"/></div>
 
The network architecture of the proposed VST-Net. It consists of three major components: SubNet1, SubNet2 and SubNet3. “C”, “B” and “R” stand for the Conv, BN and ReLU layers, respectively. For visual convenience, only one image from the 32 feature maps/images in the output of SubNet1 and SubNet2 is shown.
### Fig.2
<div align=center><img src="https://github.com/yqx7150/VST-Net/blob/master/fig/fig2.png" alt="Fig.2."/></div>

A special case of Fig. 1. The channel number of the last Conv layer at SubNet1 and SubNet2 is 1.
### Fig.3
PSNR (dB) and SSIM performance of different methods on Set11 over four peaks at 0.1, 2, 10 and 30.
<div align=center><img src="https://github.com/yqx7150/VST-Net/blob/master/fig/fig3.png" width="700" height="900" alt="Fig.3."/></div>

## Requirements and Dependencies
    MATLAB R2015b
    Cuda-8.0

## How to test
"./Demo_test_VST_Net.m" is the demo for TEST.

## [Paper](https://www.sciencedirect.com/science/article/pii/S1047320319301439)
        @article{zhang2019vst, 
        title={VST-Net: Variance-stabilizing Transformation Inspired Network for Poisson Denoising}, 
        author={Zhang, Minghui and Zhang, Fengqin and Liu, Qiegen and Wang, Shanshan}, 
        journal={Journal of Visual Communication and Image Representation}, 
        year={2019}, 
        publisher={Elsevier}  
        }



## Other Related Projects
  * Variable augmented neural network for decolorization and multi-exposure fusion [<font size=5>**[Paper]**</font>](https://www.sciencedirect.com/science/article/abs/pii/S1566253517305298)   [<font size=5>**[Code]**</font>](https://github.com/yqx7150/DecolorNet_FusionNet_code)   [<font size=5>**[Slide]**</font>](https://github.com/yqx7150/EDAEPRec/tree/master/Slide)
