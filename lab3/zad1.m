%% Preparation
clearvars;
close all;
clc;

%% Load LUT
load funkcjeLUT;

%% Example
figure(1);
plot(kwadratowa);

%% Read files
lena = imread('lena.bmp');
circle = imread('kolo.bmp');
square = imread('kwadrat.bmp');
jet = imread('jet.bmp');

%% kwadratowa
figure(2);
LUT(lena, kwadratowa);

%% odwrotna
figure(3);
LUT(jet, odwrotna);

%% odwlog
figure(4);
LUT(jet, odwlog);

%% pila
figure(5);
LUT(jet, pila);

%% wykladnicza
figure(6);
LUT(jet, wykladnicza);

%% log
figure(7);
LUT(jet, log);