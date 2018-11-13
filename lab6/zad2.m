% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% imread
lenaSzum = imread('lenaSzum.bmp');

%% median filter
figure;
subplot(1, 3, 1);
imshow(lenaSzum); 
title('original');

subplot(1,3,2);
imshow(medfilt2(lenaSzum));
title('median filter');

subplot(1,3,3);
imshow(imabsdiff(lenaSzum,medfilt2(lenaSzum)));
title('diff of images');

%% 10 times median filter
lenaSzum10 = lenaSzum;
for i = 0:10
    lenaSzum10 = medfilt2(lenaSzum10);
end

figure;
subplot(1, 2, 1); 
imshow(lenaSzum); 
title('original');

subplot(1, 2, 2); 
imshow(medfilt2(lenaSzum10));
title('after performing it 10 times');

