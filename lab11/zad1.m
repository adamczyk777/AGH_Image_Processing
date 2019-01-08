% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('ccl1.png');

%% Excercise

indexated = indexate(image);

figure;
imshow(label2rgb(indexated));
