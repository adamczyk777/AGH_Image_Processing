% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% imread
moon = imread('moon.bmp');

%% Laplacian
laplacianFilter = fspecial('laplacian');
M = [ 0 1 0; 1 -4 1; 0 1 0] / 9;

convoluted = uint8(conv2(moon, laplacianFilter, 'same'));

figure;
subplot(2,2,1);
imshow(convoluted + 128);
title('laplacian with added 128');

subplot(2,2,2);
imshow(abs(convoluted));
title('laplacian filter treated with abs()');

subplot(2,2,3);
imshow(moon + convoluted + 128);
title('moon with 128');

subplot(2,2,4);
imshow(moon + abs(convoluted));
title('moon with abs');