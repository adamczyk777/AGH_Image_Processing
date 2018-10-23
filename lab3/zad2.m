%% Preparation
clearvars;
close all;
clc;

%% Wczytywanie
lena = imread('lena.bmp');
jet = imread('jet.bmp');

%% SUM
img_sum = imadd(lena, jet, 'uint16');

figure(1);
imshow(img_sum, []);
title('Dodawanie');

%% LINEAR COMBINATION
img_comb = imlincomb(1, lena, 2.5, jet, 'uint16');

figure(2);
imshow(img_comb, []);
title('Kombinacja Liniowa');

%% SUBTRACT
img_sub = imsubtract(int16(lena),int16(jet));

figure(3);
imshow(img_sub,[]);
title('Odejmowanie');

%% MULTIPLICATION
img_mul = immultiply(int16(lena), int16(jet));

figure(4);
imshow(img_mul, []);
title('Mnożenie');

img_mul2 = immultiply(int16(lena), 3);

figure(5);
imshow(img_mul2, []);
title('Mnożenie przez stałą');

mask = imread('kolo.bmp');
mask = boolean(mask);
img_mul3 = immultiply(lena, mask);

figure(6);
imshow(img_mul3, []);
title('Mnożenie przez maskę');

%% NEGATIVE
img_neg = imcomplement(jet);

figure(7);
imshow(img_neg);
title('Negatyw');