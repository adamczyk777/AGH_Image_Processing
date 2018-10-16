%% Preparation
clearvars;
close all;
clc;

%% otwieranie obrazu
parrot = imread('parrot.bmp');
clock = imread('clock.bmp');
lena = imread('lena.bmp');
chessboard = imread('chessboard.bmp');

%% wartosc rescale
image = parrot;

figure(1)
imshow(image)

xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(image);

%% rescaling image using neighbor method
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

yStep = YY/nYY;
xStep = XX/nXX;

% rescaling loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        y = round(ii * yStep);
        x = round(jj * xStep);
        
        % out of bounds secure
        if(y > YY - 1)
            y = YY - 1;
        end
        if(x > XX - 1)
            x = XX - 1;
        end
        
        nI(ii + 1, jj + 1) = image(y + 1, x + 1);
    end
end

% showing images
figure(2);
imshow(nI);
