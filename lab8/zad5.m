% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
szkielet = imread('szkielet.bmp');
image = szkielet;

%% Task
lut = makelut(@lutFn, 3);

luted = applylut(image, lut);
figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(luted);
title('luted');






