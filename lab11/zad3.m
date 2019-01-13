% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('images/ccl2.png');

%% MATLAB inbuilt indexation function test

indexated4 = bwlabel(image, 4);
indexated8 = bwlabel(image, 8);

figure;
subplot(1,2,1);
imshow(indexated4);
title('4 neighbourhood');
subplot(1,2,2);
imshow(indexated8);
title('8 neighbourhood');