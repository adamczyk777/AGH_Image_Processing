% Jakub Adamczyk
% Colored Images
%% Clearing workspace
clearvars;
close all;
clc;

%% Reading images

lena = imread('lenaRGB.bmp');
jezioro = imread('jezioro.jpg');

image = jezioro;

%% Task

% extracting rgb
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);

figure(1);
subplot(1,3,1);
imhist(red, 256);
title('Red');

subplot(1,3,2);
imhist(green, 256);
title('Green');

subplot(1,3,3);
imhist(blue, 256);
title('Blue');

%% adjusting
eqImage = image;

% red eq
eqImage(:,:,1) = histeq(red, 256);

% green eq
eqImage(:,:,2) = histeq(green, 256);

% blue eq
eqImage(:,:,3) = histeq(blue, 256);

figure(2);
imshow(eqImage);

%% HSV
hsvImage = rgb2hsv(image);

h = hsvImage(:,:,1);
s = hsvImage(:,:,2);
v = hsvImage(:,:,3);

figure(3);
subplot(1,3,1);
imhist(h, 256);
title('H');

subplot(1,3,2);
imhist(s, 256);
title('S');

subplot(1,3,3);
imhist(v, 256);
title('V');

% brightness
hsvImage(:,:,3) = histeq(v, 256);

hsvImage = hsv2rgb(hsvImage);
figure(4);
subplot(1,2,1);
imshow(hsvImage);
title('manipulated');
subplot(1,2,2);
imshow(image);
title('original');
