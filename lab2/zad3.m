%% Preparation
clearvars;
close all;
clc;

%% TASK
lena = imread('lena.bmp');

%% reference
figure(1);
imshow(lena)

%% 256x256
lena2 = imresize(lena, 0.5);
figure(2);
imshow(lena2,'InitialMagnification', 200)

%% 128x128
lena3 = imresize(lena2, 0.5);
figure(3);
imshow(lena3,'InitialMagnification', 400)

%% 64x64
lena4 = imresize(lena3, 0.5);
figure (4)
imshow(lena4,'InitialMagnification', 800)
