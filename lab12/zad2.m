% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images

image = imread('images/lena.bmp');

%% Excercise
[f1, f2] = freqspace(512, 'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);

Hd(r>0.1) = 0;

colormap(jet(64));
mesh(f1, f2, Hd);
