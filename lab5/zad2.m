% Jakub Adamczyk
% Binaryzacja adaptacyjna
%% Clearing workspace
clearvars;
close all;
clc;

%% Task

rice = imread('rice.png');

image = rice;

imageBW = localBinarization(image);

figure;
imshow(imageBW);