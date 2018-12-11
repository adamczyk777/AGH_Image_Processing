% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% images

knee = imread('knee.png');
image = knee;

%% Task
figure;
imshow(image);
[x, y] = ginput(1);
x = floor(x);
y = floor(y);

image = double(image);

[xImage, yImage] = size(image);

visited = zeros(xImage, yImage);
segmented = zeros(xImage, yImage);
stack = zeros(10000, 2);
iStack = 1;

visited(x, y) = 1;
segmented(x, y) = 1;
stack(iStack, 1:2) = [x, y];

tollerance = 32;
nS = 0;
mV = 0;
while iStack > 0
    px = stack(iStack, 1);
    py = stack(iStack, 2);
    iStack = iStack-1;
    nS =nS + 1;
    mV = (mV * (nS - 1) + image(px, py)) / nS;
    
    if px > 1 && px < xImage && py > 1 && py < yImage
        for itx = px-1:px+1
            for ity = py-1:py+1
                if itx~=px && ity~=py && visited(itx,ity)==0 && ((abs(image(itx,ity) - mV)) < tollerance)
                    iStack=iStack+1;
                    stack(iStack, :) = [itx, ity];
                    segmented(itx,ity) = image(itx,ity);
                elseif itx==px && ity==py
                    segmented(itx,ity) = image(itx,ity);
                end
                visited(itx,ity)=1;
            end
        end    
    end
end

figure;
imshow(segmented,[]);





