% Jakub Adamczyk
% Binaryzacja zad1
%% Clearing workspace
clearvars;
close all;
clc;

%% Image Read

coins = imread('coins.png');
figura = imread('figura.png');
figura2 = imread('figura2.png');
figura3 = imread('figura3.png');
figura4 = imread('figura4.png');
rice = imread('rice.png');
tekst = imread('tekst.bmp');
obiekty = imread('obiekty.bmp');
katalog = imread('katalog.bmp');

image = coins;

%% coins

drawBinary(image, (89/255));

%% Figura binarization
image = figura;

drawBinary(image, 89/255);

%% Figura 2 binary
image = figura2;

threshold = 130;
thr = threshold/255;

drawBinary(image, thr);

%% Figura 3 binary
image = figura3;

threshold = 180;
thr = threshold/255;

drawBinary(image, thr);

%% Figura4 binarization
image = figura4;

threshold = 55;
thr = threshold/255;

drawBinary(image, thr);

%% OTSU
image = coins;
thr = otsuthresh(imhist(image, 256));

drawBinary(image, thr);

% Ręcznie było lepiej

%% ClusterKittler
image = coins;
threshold = clusterKittler(image);
thr = threshold/255;

drawBinary(image, thr);

%% entropyYen
image = coins;
threshold = entropyYen(image);
thr = threshold/255;

drawBinary(image, thr);

%% All binarizations
compareBinarizations(coins, 89/256);
compareBinarizations(rice, 89/256);
compareBinarizations(tekst, 89/256);
compareBinarizations(obiekty, 89/256);
compareBinarizations(katalog, 89/256);



