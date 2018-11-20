% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% declaring local window
load MR_data;
localWindow = [4 4];

%% images
img1 = I_noisefree;
img2 = I_noisy1;
img3 = I_noisy2;
img4 = I_noisy3;
img5 = I_noisy4;

imgArray = {img1, img2, img3, img4, img5};
%% Convolutions
imgConvArray = imgArray;

for i = 1:5
    imgConvArray{i} = convolution(imgArray{i}, localWindow);
end
%% Bilateral filter

imgBilateralArray = imgArray;

for i = 1:5
    imgBilateralArray{i} = bilateral(imgArray{i}, localWindow);
end

%% Show each image set
for i = 1:5
   figure('units','normalized','outerposition',[0 0 1 1]);
   subplot(1,3,1);
   imshow(uint8(imgArray{i}), []);
   title('original image');
   subplot(1,3,2);
   imshow(uint8(imgConvArray{i}), []);
   title('convoluted image');
   subplot(1,3,3);
   imshow(uint8(imgBilateralArray{i}), []);
   title('bilaterated image');
end
