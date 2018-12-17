% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Global variables
global sLimit vLimit MRes segRes index;

%% Images

umbrella = imread('umbrella.png');
image = umbrella;

%% Parameters

colorThreshold = 5/255;
minAreaSize = 27;

%% Task
figure;
imshow(image, []);
title('original image');
 
imageHSV = rgb2hsv(image);
imageH = double(imageHSV(:,:,1));

figure;
imshow(imageH, []);
title('H vector');

%% Globals initialization
sLimit = 4;
vLimit = 0.05;
index = -1;

[y, x] = size(imageH);

segRes = zeros(y, x);
MRes = zeros(y, x);

%% Split recirsive call
split(imageH, 1, 1, x, y);

%% Loop
i = 0;
while i <= index
   IB = segRes == i;
   
   if any(IB(:))
       [yF, xF] = find(IB, 1, 'first');
       
       square = strel('square', 3);
       neighbors = imdilate(IB, square);
       diff = imabsdiff(neighbors, IB);
       pointMult = diff .* segRes;
       nonZeros = nonzeros(pointMult);
       uniqued = unique(nonZeros);
       
       isJoined = 0;
       for neighbor = 1:numel(uniqued)
           IBS = segRes == uniqued(neighbor);
           
           [yFS, xFS] = find(IBS, 1, 'first');
           
           colorDiff = abs(MRes(yF,xF) - MRes(yFS, xFS));
           if colorDiff < colorThreshold
               segRes(IBS) = i;
               isJoined = 1;
           end
       end
       if isJoined == 0
          i = i + 1;
       end
   else
       i = i + 1;
   end
end

figure;
imshow(segRes,[]);

U = unique(segRes);

for idx = 1:numel(U)
    C = segRes == U(idx);
    if sum(C) < minAreaSize
       segRes(C) = 0; 
    end
end

U = unique(segRes);

for idx = 1:numel(U)
    C = segRes == U(idx);
    segRes(C) = idx;
end

finalImage = label2rgb(segRes);

figure;
imshow(finalImage);