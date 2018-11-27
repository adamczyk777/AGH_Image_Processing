% Jaku Adamczyk
%% Preparation
clear;
clc;
close all;

%% images
fingerprint = imread('fingerprint.bmp');
text = imread('text.bmp');
kosc = imread('kosc.bmp');

%% thinning

image = fingerprint;
thinnedImage1 = bwmorph(image, 'thin', 1);
thinnedImage2 = bwmorph(image, 'thin', 2);
thinnedImageInf = bwmorph(image, 'thin', Inf);

figure;
subplot(2,2,1);
imshow(image);
title('original');
subplot(2,2,2);
imshow(thinnedImage1);
title('thinned 1');
subplot(2,2,3);
imshow(thinnedImage2);
title('thinned 2');
subplot(2,2,4);
imshow(thinnedImageInf);
title('thinned 3');

%% skeletonization
image = kosc;
skeletedImage = bwmorph(image, 'skel', Inf);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(skeletedImage);
title('skeletonized');

%% morphological reconstruction

image = text;
square = strel('square', 3);
SE = ones(51, 1);

edited = image; 
edited = imerode(edited, square);
edited = imdilate(edited, square);

marker = imerode(image, SE);
mask = image;
reconstructed = imreconstruct(marker, mask);

figure;
subplot(2,2,1);
imshow(image);
title('original');
subplot(2,2,2);
imshow(edited);
title('opened');
subplot(2,2,3);
imshow(reconstructed);
title('reconstructed');

%% clearing border
image = text;

figure;
imshow(imclearborder(image));

%% filling holes
image = text;

figure;
imshow(imfill(image,'holes'));
