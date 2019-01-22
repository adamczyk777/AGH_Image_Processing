% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images

literki = imread('images/literki.bmp');
wzorA = imread('images/wzorA.bmp');

%% Displaying images
figure;
subplot(1,2,1);
imshow(literki);
subplot(1,2,2);
imshow(wzorA);

%% roation of wzorA

wzorARot = rot90(wzorA, 2);

%% Fourier of both images

literkiFFT = fft2(literki, 256, 256);
wzorARotFFT = fft2(wzorARot, 256, 256);

%% multiplication of images

multiImage = literkiFFT .* wzorARotFFT;

%% reverse fourier transform

resultImage = ifft2(multiImage);

figure;
imshow(resultImage, []);

%% top hat transform

resultImage = imtophat(resultImage, strel('square', 3));

%% display result of operations

figure;
imshow(resultImage, []);


