% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% Read Images

dwiefale = imread('images/dwieFale.bmp');
kolo = imread('images/kolo.bmp');
kwadrat = imread('images/kwadrat.bmp');
kwadrat45 = imread('images/kwadrat45.bmp');
trojkat = imread('images/trojkat.bmp');

fourierHelper(dwiefale);
fourierHelper(kolo);
fourierHelper(kwadrat);
fourierHelper(kwadrat45);
fourierHelper(trojkat); 
