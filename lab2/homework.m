% Bicubic method
%% Preparation
clearvars;
close all;
clc;
load('a1.mat');

%% Opening Images
image = imread('parrot.bmp');

%% Diff

fprintf('Interpolacja dwuliniowa: ');
tic;
bilinearResult = bilinearFn(image, 3, 3);
toc;

fprintf('Interpolacja dwusześcienna: ');
tic;
bicubicResult = bicubicFn(image, 3, 3);
toc;

figure(1);
imshow(bilinearResult);
title('Dwuliniowa');
figure(2);
imshow(bicubicResult);
title('Dwusześcienna');