% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('images/ccl1.png');

%% Indexation

indexated = indexate(image);

figure;
imshow(label2rgb(indexated));
