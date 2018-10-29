function [pix, pixX, pixY, pixXY] = partials(X, XX, YY, image)
%PARTIALX Summary of this function goes here
%   Detailed explanation goes here

preXX = X(1) - 1;

if preXX == 0
    preXX = 1;
end

postXX = X(1) + 1;
if postXX >= XX
    postXX = XX;
end

preXY = X(2) - 1;
if preXY == 0
    preXY = 1;
end

postXY = X(2) + 1;
if postXY >= YY
    postXY = YY;
end

pix = image(X(1), X(2));
pixX = (image(postXX, X(2)) - image(preXX, X(2))) / 2;
pixY = (image(X(1), postXY) - image(X(1), preXY)) / 2;
pixXY = (image(postXX, postXY) - image(preXX, X(2)) - image(X(1), preXY) + image(X(1), X(2))) / 4;

end

