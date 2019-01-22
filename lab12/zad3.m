% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('images/lunar.bmp');

%% show image
fourier = fft2(image);
shifted = fftshift(fourier);
amplitude = log10(abs(shifted)+1);

phase = angle(shifted.*(amplitude>0.0001));

figure;
subplot(1,3,1);
imshow(image);
title('original image');
subplot(1,3,2);
imshow(amplitude, []);
title('amplitude');
subplot(1,3,3)
imshow(phase, []);
title('phase');

%% correction
th = 10;
shifted(amplitude >= th) = 0;

%% reverting
unshifted = ifftshift(shifted);
unfourier = ifft2(unshifted);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(uint8(unfourier));
title('undone');