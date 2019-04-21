clear
clc;
%filename = 'C:\Users\KSRAO\Documents\Dataset\CMUwithGCI\CMU\bdl file\SPEECH\arctic_a0038_speech.wav';
%filename = 'C:\Users\KSRAO\Documents\Dataset\LYRICS Dataset\LYRICS_16k_package\audio\B6-glis-2-notsure-a-mj.wav';
%filename = 'C:\Users\KSRAO\Documents\Dataset\LYRICS Dataset\LYRICS_16k_package\audio\B4-cresc-u-G3-m1.wav';
filename = 'C:\Users\KSRAO\Documents\Dataset\LYRICS Dataset\LYRICS_16k_package\audio\S3-vt-u-G4C5-f-m2.wav';
pitch = PitchExtraction(filename);

Fs = 16000;
a = miraudio(filename,'Sampling',Fs);
a_v1 = mirgetdata(a);
f = mirframe(a,'Length',0.05,'s','Hop',0.01,'s');
s = mirspectrum(f,'Length',8192);
s_v1 = mirgetdata(s);
f_v1 = get(f,'FramePos');
s_v2 = get(s,'Pos');

figure
spectrogram(a_v1,ceil(Fs*0.05),ceil(Fs*0.04),8192,Fs,'yaxis')
% hold on;
% ylim([0.05 2]); % To ensure frequencies between 50 Hz and 2 kHz are highlighted.
hold on;
if(f_v1{1,1}{1,1}(1,end) >= 60)
    plot(f_v1{1,1}{1,1}(1,:)./60, pitch./1000,'--r');
else
    plot(f_v1{1,1}{1,1}(1,:), pitch./1000,'--r');
end
hold off;
title(filename);