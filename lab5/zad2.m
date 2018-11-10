% Jakub Adamczyk
% Binaryzacja adaptacyjna
%% Clearing workspace
clearvars;
close all;
clc;

%% Task

rice = imread('rice.png');
katalog = imread('katalog.bmp');

%% Local

riceBW = localBinarization(rice);
katalogBW = localBinarization(katalog);

figure;
subplot(1,2,1);
imshow(rice);
title('original');
subplot(1,2,2);
imshow(riceBW);
title('binary');

figure;
subplot(1,2,1);
imshow(katalog);
title('original');
subplot(1,2,2);
imshow(katalogBW);
title('binary');

%% Sauvoli

riceSauvoli = localBinarizationSauvoli(rice, 0.15, 128, 15);
katalogSauvoli = localBinarizationSauvoli(katalog, 0.15, 128, 15);

figure;
subplot(1,2,1);
imshow(rice);
title('original');
subplot(1,2,2);
imshow(riceSauvoli);
title('binary');

figure;
subplot(1,2,1);
imshow(katalog);
title('original');
subplot(1,2,2);
imshow(katalogSauvoli);
title('binary');