% Jakub Adamczyk
% Histogram Matching
%% Clearing workspace
clearvars;
close all;
clc;

%% Reading images
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');
phobos = imread('phobos.bmp');

image = phobos;

%% histogramZadany

load('histogramZadany');

% plot histogramZadany
figure(1);
plot(histogramZadany);

% adjusting image using hsitogramZadany
eqImage = histeq(image, histogramZadany);

figure(2);
subplot(1,3,1);
imshow(eqImage);
title('hiteqd image');

subplot(1,3,2);
imhist(image, 256);
title('histogram');

subplot(1,3,3);
adjustedImage = imadjust(eqImage);
adapted = adapthisteq(adjustedImage, 'clipLimit', 0.02, 'Distribution', 'rayleigh');
imshow(adapted);
title('rozciaganie oraz adaptacyjne wyrownanie CLAHE');

% zabieg uwydatnił szczegóły obrazka, ammy więcej contentu na obrazie
% dzięki odpowiedniej manipulacji kontrastem


