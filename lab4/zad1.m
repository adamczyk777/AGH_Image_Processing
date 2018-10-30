% Jakub Adamczyk
%% Clearing workspace
clearvars;
close all;
clc;

%% Reading images
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

%% Histograms

hist1 = imread('hist1.bmp');
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

%% show formatted images

% lena1
figure(1);
subplot(2,4,1);
imshow(lena1);
subplot(2,4,5);
imhist(lena1, 256);
% lena2
subplot(2,4,2);
imshow(lena2);
subplot(2,4,6);
imhist(lena2, 256);
% lena3
subplot(2,4,3);
imshow(lena3);
subplot(2,4,7);
imhist(lena3, 256);
% lena4
subplot(2,4,4);
imshow(lena4);
subplot(2,4,8);
imhist(lena4, 256);

%% Histogram 1

figure(2);
subplot(2, 1, 1);
imshow(hist1)
subplot(2, 1, 2);
imhist(hist1, 256);

%% Adjusted Histogram 1
figure(3);
adjustedHist1 = imadjust(hist1);
subplot(2,1,1);
imshow(adjustedHist1);
subplot(2,1,2);
imhist(adjustedHist1, 256);
title("Adjusted Histogram 1");

%% Cumulated hist
[H, x, C2] = cumulatedHist(hist1);
figure(4);
subplot(1,2,1);
imshow(hist1);
subplot(1,2,2);
plot(x,H);
hold on;
plot(x, C2);
title('Cumulated Histogram');

%% Histogram adjustment using LUT

lut = uint8(255*(C2/max(C2)));
[Hlut, xlut] = imhist(intlut(hist1, lut),256);
tmpC = cumsum(Hlut);
k = max(tmpC) / max(Hlut);
Clut = tmpC / k; 

figure(4);
subplot(4, 1, 1);
imshow(intlut(hist1, lut));
title('LUT converted');

subplot(4,1,2);
histeq(hist1, 256);
title('histeq treated');

subplot(4,1,3); 
plot(xlut, Hlut);
title('histogram');

subplot(4,1,4); 
plot(xlut, Clut);
title('cumulated histogram');

%% hiusteq adapthisteq

% hist2 image
figure(5);
subplot(4,4,1); imshow(hist2); 
title('null');
subplot(4,4,2); imshow(imadjust(hist2)); 
title('adjusted');
subplot(4,4,3); imshow(histeq(hist2)); 
title('histeq treated');
subplot(4,4,4); imshow(adapthisteq(hist2)); 
title('adapthisteq treated');

% hist3 image
subplot(4,4,5); imshow(hist3); 
subplot(4,4,6); imshow(imadjust(hist3)); 
subplot(4,4,7); imshow(histeq(hist3)); 
subplot(4,4,8); imshow(adapthisteq(hist3)); 

% hist4 image
subplot(4,4,9); imshow(hist4);
subplot(4,4,10); imshow(imadjust(hist4)); 
subplot(4,4,11); imshow(histeq(hist4)); 
subplot(4,4,12); imshow(adapthisteq(hist4));




