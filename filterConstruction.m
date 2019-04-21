function [a1_v1, filt_a1_v1, timeInstants, p_v1] = filterConstruction(filename, Fs)

a = miraudio(filename,'Sampling',Fs);
f = mirframe(a,'Length',0.05,'s','Hop',0.01,'s');
a1 = mirautocor(f);
a1_v1 = mirgetdata(a1);
a1_v2 = get(a1,'Pos');

f1{1} = mirfilterbank(a,'Manual',[50 75]);
f1{2} = mirfilterbank(a,'Manual',[50 100]);
f1{3} = mirfilterbank(a,'Manual',[50 150]);
f1{4} = mirfilterbank(a,'Manual',[50 200]);
f1{5} = mirfilterbank(a,'Manual',[50 300]);
f1{6} = mirfilterbank(a,'Manual',[50 400]);
f1{7} = mirfilterbank(a,'Manual',[50 600]);
f1{8} = mirfilterbank(a,'Manual',[50 800]);

for i = 1:8
    temp = mirautocor(f1{i},'Frame',0.05,'s',0.01,'s');
    filt_a1_v1(:,:,i) = mirgetdata(temp);
end
timeInstants = a1_v2{1,1}{1,1}(:,1);
p = mirpeaks(a1);
p_v1 = mirgetdata(p);
p_v1 = 1./p_v1;
end