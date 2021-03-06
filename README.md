# **hf0**
## **hf0**:  A hybrid pitch extraction method for multimodal voice

**hf0** is a monophonic pitch tracker based on a shallow convolutional neural network operating over the time-domain normalized autocorrelation function. $hf_0$ works reliabilty over monophonic speech, monophonic songs, emotional speech, para-linguistic speech and infant cry signals. $hf_0$ is robust to varied noises and comparable against the state-of-the-art methods. 

## Dependencies

This code requires was tested in `MATLAB 2018a` version. The [MIR Toolbox 1.7.2](https://www.jyu.fi/hytk/fi/laitokset/mutku/en/research/materials/mirtoolbox) is required for the execution of the program.

## Execution of hf0
Execute `demo.m` file by replacing `filename` variable with the respective audio file.

## Calculation of Number of Parameters in CREPE vs Proposed method

The Proposed method uses one-sixth of the parameters used in CREPE. The detailed layer-by-layer analysis is provided below. The activation, max-pooling and dropout layers consume zero parameters. The parameters in fully connected layer depend on the input and the output neurons which are updated in the table as width and height of the receptive field. The bias term included for all the layers.

<table class="tg">
  <tr>
    <th class="tg-amwm" colspan="5">CREPE</th>
  </tr>
  <tr>
    <td class="tg-amwm">Layers</td>
    <td class="tg-amwm">No. of Filters</td>
    <td class="tg-amwm">Width of  the<br>Receptive Field</td>
    <td class="tg-amwm">Height of the <br>Receptive Field</td>
    <td class="tg-amwm">No of Parameters</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv1</td>
    <td class="tg-baqh">1024</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">512</td>
    <td class="tg-baqh">525312</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv2</td>
    <td class="tg-baqh">128</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">8320</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv3</td>
    <td class="tg-baqh">128</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">8320</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv4</td>
    <td class="tg-baqh">128</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">8320</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv5</td>
    <td class="tg-baqh">256</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">16640</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv6</td>
    <td class="tg-baqh">512</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">33280</td>
  </tr>
  <tr>
    <td class="tg-baqh">Softmax</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">2048</td>
    <td class="tg-baqh">360</td>
    <td class="tg-baqh">737281</td>
  </tr>
  <tr>
    <td class="tg-baqh" align="center" colspan="4">Total number of parameters<br></td>
    <td class="tg-baqh">1337473</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="5"></td>
  </tr>
  <tr>
    <th class="tg-amwm" colspan="5">Proposed Method</th>
  </tr>
  <tr>
    <td class="tg-baqh">Conv1</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">3</td>
    <td class="tg-baqh">3</td>
    <td class="tg-baqh">640</td>
  </tr>
  <tr>
    <td class="tg-baqh">Conv2</td>
    <td class="tg-baqh">64</td>
    <td class="tg-baqh">3</td>
    <td class="tg-baqh">3</td>
    <td class="tg-baqh">640</td>
  </tr>
  <tr>
    <td class="tg-baqh">Softmax</td>
    <td class="tg-baqh">1</td>
    <td class="tg-baqh">25600</td>
    <td class="tg-baqh">9</td>
    <td class="tg-baqh">230401</td>
  </tr>
  <tr>
    <td class="tg-baqh" align="center" colspan="4">Total number of parameters</td>
    <td class="tg-baqh">231681</td>
  </tr>
</table>

## Sample Experiments
Some experiments are conducted over audio files from varied datasets and **hf0** is compared with the standard [pYIN](https://ieeexplore.ieee.org/document/6853678) and [CREPE](https://arxiv.org/abs/1802.06182) based pitch estimation methods. As pitch contour is not available for all the audio samples, the estimated pitch is superimposed over the spectrogram.




## Pitch Contour of a neutral speech taken from [CMU-ARCTIC](http://www.festvox.org/cmu_arctic/) Dataset
![ARCTIC_A0038_SPEECH_Comp](https://user-images.githubusercontent.com/14876105/56469395-03313680-6457-11e9-9945-ee9ea78e344d.jpg)
## Pitch Contour of Crescendo singing voice taken from [LYRICS](http://tcts.fpms.ac.be/publications/papers/2013/icassp2013_obtdndatd.pdf) Dataset.
![B4_CRESC_U_G3_M1_Comp](https://user-images.githubusercontent.com/14876105/56469396-03c9cd00-6457-11e9-8909-7f86c4a113f7.jpg)
## Pitch Contour of Glissando singing voice taken from [LYRICS](http://tcts.fpms.ac.be/publications/papers/2013/icassp2013_obtdndatd.pdf) Dataset.
![B6_GLIS_2_NOTSURE_A_MJ_Comp](https://user-images.githubusercontent.com/14876105/56469398-03c9cd00-6457-11e9-855c-4ab84c0b32ea.jpg)
## Pitch Contour of Soparano singing voice taken from [LYRICS](http://tcts.fpms.ac.be/publications/papers/2013/icassp2013_obtdndatd.pdf) Dataset.
![S3_VT_U_G4C5_F_M2_Comp](https://user-images.githubusercontent.com/14876105/56469401-04626380-6457-11e9-9ec9-6ec66dcc52e7.jpg)
### Pitch Contour of an Anger emotion taken from [Hindi Emotional Speech Corpus](https://ieeexplore.ieee.org/document/5738540)
![Anger09_Comp](https://user-images.githubusercontent.com/14876105/56469394-03313680-6457-11e9-81c0-e52b4094c573.jpg)
### Pitch Contour of an Disgust emotion taken from [Hindi Emotional Speech Corpus](https://ieeexplore.ieee.org/document/5738540)
![Disgust02_Comp](https://user-images.githubusercontent.com/14876105/56469399-04626380-6457-11e9-9a67-6fc556bafc4a.jpg)
### Pitch Contour of an Happy emotion taken from [Hindi Emotional Speech Corpus](https://ieeexplore.ieee.org/document/5738540)
![Happy08_Comp](https://user-images.githubusercontent.com/14876105/56469400-04626380-6457-11e9-8113-4b0fc5ea2180.jpg)
