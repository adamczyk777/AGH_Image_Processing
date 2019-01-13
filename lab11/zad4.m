% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images
image = imread('images/shapes.png');

%% Image Detection
labeled = bwlabel(image, 8);

coefficients = obliczWspolczynniki(labeled);

r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1), r(i).Centroid(2), ['\color{magenta}', num2str(i)]);
end

[height, width] = size(labeled);

for y=1:height
    for x=1:width
        pixel = labeled(y,x); % obliczanie srodlka ciezkosci
        if (pixel ~= 0 && ~(wsp(pixel, 2) > 0.33 && wsp(pixel, 2) < 0.66))
            labeled(i,j) = 0;
        end
    end
end


figure;
imshow(labeled);    
