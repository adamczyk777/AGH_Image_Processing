% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

load('maskiPP.mat');

%% imread

image = imread('kw.bmp');


%% detecting edges with masks

gradients(image, R1);

gradients(image, R2);

gradients(image, P1);

gradients(image, P2);

gradients(image, S1);

gradients(image, S2);

%% combined
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs((conv2(image, S1, 'same')).^2) + abs((conv2(image, S2, 'same')).^2);

figure;
imshow(OW);

figure;
imshow(OW2);

%% Jet
image = imread('jet.bmp');

gradients(image, R1);

gradients(image, R2);

gradients(image, P1);

gradients(image, P2);

gradients(image, S1);

gradients(image, S2);

%% combined
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs((conv2(image, S1, 'same')).^2) + abs((conv2(image, S2, 'same')).^2);

figure;
imshow(OW, []);

figure;
imshow(OW2, []);

