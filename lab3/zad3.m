%% Preparation
clearvars;
close all;
clc;

%% Read images

kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');

%% boolean
kolo = boolean(kolo);
kwadrat = boolean(kwadrat);

%% Logical
not_kolo = ~kolo;
figure(1);
imshow(not_kolo);
title('not');

and_img = kolo & kwadrat;
figure(2);
imshow(and_img);
title('and');

or_img = kolo | kwadrat;
figure(3);
imshow(or_img);
title('or');

xor_img = xor(kolo, kwadrat);
figure(4);
imshow(xor_img);
title('xor');



