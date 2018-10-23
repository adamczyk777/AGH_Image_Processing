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

%% rescaling image using bilinear method
nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

nI = uint8(zeros(nYY, nXX));

yStep = YY/nYY;
xStep = XX/nXX;

% rescaling loop
for ii = 0:nYY-1
    for jj = 0:nXX - 1
        i1 = floor(ii * xStep);
        j1 = floor(jj * yStep);
        i2 = i1+1;
        j2 = j1+1;
        
        % out of bounds securing
        if (i2 >XX-1)
            i2 = XX-1;
        end
        if (j2 > YY-1)
            j2 = YY-1;
        end
        
        in = rem(ii,1);
        jn = rem(jj,1);
        
        fa = double(image(j1+1,i1+1));
        fb = double(image(j1+1,i2+1));
        fc = double(image(j2 + 1, i2 + 1));
        fd = double(image(j2 + 1,i1 + 1));
        
        nI(jj+1, ii+1) = [1-in in] * [fa fd; fb fc] * [1-jn; jn];
    end
end

% showing images
figure(2);
imshow(nI);
