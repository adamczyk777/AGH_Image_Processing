% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
ertka = imread('ertka.bmp');
buzka = imread('buzka.bmp');
wyspa = imread('wyspa.bmp');
kolka = imread('kolka.bmp');
hom = imread('hom.bmp');
image = ertka;

%% erosion
square = strel('square', 3);
circle = strel('diamond', 3);
eroded = imerode(image, square);
circleEroded = imerode(image, circle);

erodedmore = image;
for i= 1:4
    erodedmore = imerode(erodedmore, square);
end

figure;
subplot(1,4,1)
imshow(image);
title('original');
subplot(1,4,2);
imshow(eroded);
title('eroded');
subplot(1,4,3);
imshow(erodedmore);
title('eroded 4 times');
subplot(1,4,4);
imshow(circleEroded);
title('eroded with circle');

image = buzka;
matrix = [1 1 1; 1 1 1];
eroded = imerode(image, matrix);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(eroded);
title('eroded');

%% dilatate
image = ertka;
dilatated = imerode(image, square);
circleDilatate = imerode(image, circle);

dilatatedmore = image;
for i= 1:4
    dilatatedmore = imerode(dilatatedmore, square);
end

figure;
subplot(1,4,1)
imshow(image);
title('original');
subplot(1,4,2);
imshow(dilatated);
title('dilatated');
subplot(1,4,3);
imshow(dilatatedmore);
title('dilatated 4 times');
subplot(1,4,4);
imshow(circleDilatate);
title('eroded with circle');

%% all 4 operations on one plot

% ertka
compareForImage(ertka);
compareForImage(wyspa);
compareForImage(kolka);

%% hom
% masks
SE1 = [0 1 0;1 1 1;0 1 0];
SE2 = [1 0 1;0 0 0;1 0 1];

image = hom;
imHitmiss = bwhitmiss(image, SE1, SE2);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(imHitmiss);
title('detecc');





