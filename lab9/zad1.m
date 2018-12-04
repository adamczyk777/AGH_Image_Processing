% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
dom = imread('dom.png');
image = dom;

%% Detection LoG

detection1 = edge(image, 'log');
figure;
imshow(detection1);
title('LoG');

%% Detection Canny

detection2 = edge(image, 'canny');
figure;
imshow(detection2);
title('canny');

%% Detection sobel
detection3 = edge(image, 'sobel');
figure;
imshow(detection3);
title('sobel');