% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
load('gra.mat');
image = obraz;

%% Task

lut = makelut(@gofFn, 3);

for i = 1:100
    image = applylut(image, lut);
    imshow(image, 'InitialMagnification', 1600); 
    pause(0.1);
    refresh;
end