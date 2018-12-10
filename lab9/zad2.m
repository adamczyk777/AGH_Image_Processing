% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Hough

image = zeros(11);
image(5,5) = 1;

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imageHough1 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
imshow(imageHough1, []);
title('hough');

image(3,2) = 1;

figure;
subplot(1,2,1);
imshow(image); 
title('original');
subplot(1,2,2);
imageHough2 = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
imshow(imageHough2, []); 
title('hough');

image(6,9) = 1;
image(9,1) = 1;

[H, T, R] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
figure;
imshow(H, []);

theta = 47;
rho = 128;

x = 0:0.1:10;
y = (R(rho) - x * cosd(T(theta))) / sind(T(theta));
figure;
imshow(image, []); 
hold on;
plot(x+1,y+1);