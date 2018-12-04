% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
calculator = imread('calculator.bmp');
image = calculator;

%% task

figure;
imshow(image);

%% removal of reflections

object = ones(1, 71);
% erosion
marker = imerode(image, object);

%reconstruction
mask = image;
reconstruction = imreconstruct(marker, mask);
edited = image - reconstruction;

% open
edited2 = imopen(image, object);
edited2 = image - edited2;

figure;
subplot(3,1,1);
imshow(image);
title('original image');
subplot(3,1,2);
imshow(edited);
title('morphological reconstruion');
subplot(3,1,3);
imshow(edited2);
title('opened with object');

%% vertical

vertObj = ones(1,11);
vertEroded = imerode(edited, vertObj);
edited3 = imreconstruct(vertEroded, edited);

figure;
imshow(edited3);

%% small signs
signsObj = ones(1, 21);
dilatateMarker = imdilate(edited3, signsObj);
edited4 = imreconstruct(min(dilatateMarker, edited2), edited2);
figure;
imshow(edited4);




