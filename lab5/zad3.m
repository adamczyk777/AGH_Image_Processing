% Jakub Adamczyk
% Binaryzacja dwuprogowa
%% Clearing workspace
clearvars;
close all;
clc;

%% Task

bart = imread('bart.bmp');

bartBW = bart > 175 & bart < 210;

figure;
subplot(1,3,1);
imshow(bart);
title('original');
subplot(1,3,2);
imhist(bart);
title('histogram');
subplot(1,3,3);
imshow(bartBW);
title('binarized');