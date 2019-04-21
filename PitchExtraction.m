function pitch = PitchExtraction(filename) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Pitch Extraction from monophonic signals %%%%%%%%%%%%%%%
Fs = 16000; % Resampling frequency
load('convModel.mat'); % The convolution network model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Decoder Section %%%%%%%%%%
[autocor,subBandAutocor, ~, peaks] = filterConstruction(filename, Fs);
feature = reshape(autocor,size(autocor,1),1,1,size(autocor,2));
neighbours = 2;
for i = 1+neighbours:size(feature,4)-neighbours
    convFormat(:,:,:,i-neighbours) = feature(:,1,1,i-neighbours:i+neighbours);
end

halfLabelOutput = predict(convnet, convFormat);
[~,ind] = max(halfLabelOutput,[],2);
ind = ind - 1; % since only eight sub-bands are used and class one is represented as unvoiced
pitch = zeros(size(ind));

for i = 1:size(ind,1)
    if(ind(i) > 1)
        temp = xcorr(subBandAutocor(:,i,ind(i)), subBandAutocor(:,i,ind(i)));
        temp = temp((length(temp)+1)/2:end);
        [p(:,1),p(:,2)] = findpeaks(temp);
        if(~isempty(p))
        [~,ind1] = max(p(:,1));
        index = p(ind1,2);
        %[p1(:,1), p1(:,2)] = findpeaks(a1_v1(:,i+neighbours));
        pitch(i) = Fs./index;
        temp1 = peaks(~isnan(peaks(:,i+neighbours)) & ~isinf(peaks(:,i+neighbours)),i+neighbours);
        if(~isempty(temp1))
            [~,ind1] = min(abs(pitch(i) - temp1));
            pitch(i) = temp1(ind1);
        else
            [~, p1] = findpeaks(autocor(:,i));
            if(~isempty(p1))
                temp1 = Fs./p1;
                [~,ind1] = min(abs(pitch(i) - temp1));
                pitch(i) = temp1(ind1);
            end
        end
        
        end
        clear temp1;
        clear p;
    end
end
pitch = [zeros(neighbours,1); zeros(neighbours,1); pitch; ];
medPitch = medfilt1(pitch,11);
temp2 = abs(pitch - medPitch);
ind = find(temp2>20);
if(~isempty(ind))
    pitch(ind) = medPitch(ind);
end
end