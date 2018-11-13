% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% imread
plansza = imread('plansza.bmp');

averageFilter = fspecial('average');

mask = [1 2 1; 2 4 2; 1 2 1];
mask = mask / sum(sum(mask));

gaussianFilter = fspecial('gaussian', [5 5], 0.5);

%% Average
figure;
subplot(2, 2, 1);
imshow(plansza); 
title("original");
subplot(2, 2, 2); 
imshow(uint8(conv2(plansza, averageFilter, 'same'))); 
title("average");

subplot(2, 2, 3); 
imshow(uint8(conv2(plansza, mask, 'same')));
title("mask");

subplot(2, 2, 4);
imshow(imabsdiff(plansza, uint8(conv2(plansza ,averageFilter, 'same'))));
title('diff');

%% Gaussian mask
figure;
subplot(2, 2, 1);
mesh(fspecial('gaussian', [5 5], 0.5));
subplot(2, 2, 2);
mesh(fspecial('gaussian', [5 5], 3));
subplot(2, 2, 3);
mesh(fspecial('gaussian', [5 5], 6));
subplot(2, 2, 4);
mesh(fspecial('gaussian', [5 5], 7));

