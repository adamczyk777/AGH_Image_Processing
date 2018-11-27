% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
ferrari = imread('ferrari.bmp');
rice = imread('rice.png');
image = ferrari;

square = strel('square', 3);

eroded = imerode(image, square);
dilatated = imdilate(image, square);

erodedDiff = image - eroded;
dilatatedDiff = image - dilatated;

opened = imopen(image, square);
closed = imclose(image, square);

tophat = imtophat(image, square);
bothat = imbothat(image, square);



figure;
subplot(3,3,1);
imshow(image);
title('original');
subplot(3,3,2);
imshow(eroded);
subplot(3,3,3);
imshow(dilatated);
subplot(3,3,4);
imshow(erodedDiff);
subplot(3,3,5);
imshow(dilatatedDiff);
subplot(3,3,6);
imshow(closed);
subplot(3,3,7);
imshow(opened);
subplot(3,3,8);
imshow(tophat);
subplot(3,3,9);
imshow(bothat);

%% rice
image = rice;
disk = strel('disk', 10);
subplot(1,3,1);
imshow(image);
subplot(1,3,2);
imshow(imtophat(image, disk));
subplot(1,3,3);
imshow(imbothat(image, disk));

