% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('images/shapes.png');

%% Image Detection
labeled = bwlabel(image, 4);

coefs = obliczWspolczynniki(labeled);

figure;
imshow(labeled);
title('labeled iamge');

r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[height, width] = size(labeled);

for y=1:height
    for x=1:width
        pixel = labeled(y,x); % obliczanie srodka ciezkosci
        if (pixel ~= 0 && ~(coefs(pixel, 2) > 0.33 && coefs(pixel, 2) < 0.66))
            labeled(y,x) = 0;
        end
    end
end

figure;
imshow(labeled);

%% real objects

image = imread('images/shapesReal.png');

figure;
imshow(image);

% binarise
image = im2bw(image, 0.21);

% czyszczenie krawedzi
image = imerode(image, strel('rectangle', [3, 3]));
image = not(image);
image = imclearborder(image);
image = imclearborder(image);
image = imclearborder(image);
image = imclearborder(image);

figure;
imshow(image);

%% Image Detection
labeled = bwlabel(image, 4);

coefs = obliczWspolczynniki(labeled);

figure;
imshow(labeled);
title('labeled iamge');

r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[height, width] = size(labeled);

for y=1:height
    for x=1:width
        pixel = labeled(y,x); % obliczanie srodka ciezkosci
        if (pixel ~= 0 && ~(coefs(pixel,2) > 0.6 && coefs(pixel,2) < 0.68 && coefs(pixel, 3) > 4.5))
            labeled(y,x) = 0;
        end
    end
end

figure;
imshow(labeled);
