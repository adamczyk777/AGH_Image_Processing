%% Preparation
clearvars;
close all;
clc;

%% task
i = imread('clock.bmp');
i = imresize(i,[128,128]);

k1 = imadjust(i,[],[0,31/255]);
k2 = imadjust(i,[],[0,15/255]);
k3 = imadjust(i,[],[0,7/255]);
k4 = imadjust(i,[],[0,3/255]);
k5 = imadjust(i,[],[0,1/255]);

subplot(2,3,1)
imshow(i);

subplot(2,3,2);
imshow(k1,[])

subplot(2,3,3);
imshow(k2,[])

subplot(2,3,4);
imshow(k3,[])

subplot(2,3,5);
imshow(k4,[])

subplot(2,3,6);
imshow(k5,[])