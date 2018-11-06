% Jakub Adamczyk
% Homework
%% Clearing workspace
clearvars;
close all;
clc;

image = imread('jezioro.jpg');

%% Task BBHE
lmBBHE = mean(image(:));

% divide hists

lm = uint8(lmBBHE);

[H, x] = imhist(image);
H1 = H(1:lm);
H2 = H(lm: 255);

% normalization

H1 = H1/sum(H1);
H2 = H2/sum(H2);

% cumulated H1 H2

C1 = cumulate(H1);
C2 = cumulate(H2);

C1n = (lmBBHE) * C1;
C2n = lmBBHE+1 + (255-lmBBHE+1)*C2;

C1n = uint8(C1n);
C2n = uint8(C2n);

lut = [C1n; C2n];

luted = intlut(image, lut);

figure(1);
subplot(1,2,1);
imhist(luted, 256);
subplot(1,2,2);
imshow(luted);








