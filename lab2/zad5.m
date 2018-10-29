% Bicubic method
%% Preparation
clearvars;
close all;
clc;
load('a1.mat');

%% Opening Images
parrot = imread('parrot.bmp');
clock = imread('clock.bmp');
lena = imread('lena.bmp');
chessboard = imread('chessboard.bmp');

%% Rescale using bicubic method
image = lena;

figure(1)
imshow(image)

xReScale = 4;
yReScale = 4;

[YY, XX] = size(image);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);

xStep = XX / nXX;
yStep = YY / nYY;

nI = uint8(zeros(nXX, nYY));

for x = 1:nXX-1
    for y = 1:nYY-1
        % Getting safe
        oldY = round(y * yStep);
        if oldY >= YY
            oldY = YY - 1;
        end
        if oldY == 0
            oldY = 1;
        end
        
        oldX = round(x * xStep);
        if oldX >= XX
            oldX = XX - 1;
        end
        
        if oldX == 0
            oldX = 1;
        end
        
        % A B C D points values
        A = [oldX oldY];
        B = [oldX+1 oldY];
        C = [oldX+1 oldY+1];
        D = [oldX oldY+1];
        
        xx = x * xStep - A(1);
        yy = y * yStep - A(2);
        
        % Calculating calculating pixels with partials
        
        [pixA, pixAx, pixAy, pixAxy] = partials(A, XX, YY, image);
        [pixB, pixBx, pixBy, pixBxy] = partials(B, XX, YY, image);
        [pixC, pixCx, pixCy, pixCxy] = partials(C, XX, YY, image);
        [pixD, pixDx, pixDy, pixDxy] = partials(D, XX, YY, image);
        
        xCoef = [pixA; pixB; pixD; pixC; pixAx; pixBx; pixDx; pixCx; pixAy; pixBy; pixDy; pixCy; pixAxy; pixBxy; pixDxy; pixCxy ];
        a = A1 * double(xCoef);
        aCoef = [a(1), a(5), a(9), a(13); a(2), a(6), a(10), a(14); a(3), a(7), a(11), a(15); a(4), a(8), a(12), a(16)];
        
        % new pixel value
        newPix = [1 xx xx^2 xx^3] * aCoef * [1; yy; yy^2; yy^3];
        
        nI(x, y) = abs(newPix);
    end
end

figure(2);
imshow(nI);
