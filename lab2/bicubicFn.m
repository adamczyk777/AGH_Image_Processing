function nI = bicubicFn(image, xScale, yScale)
%BICUBI Summary of this function goes here
%   Detailed explanation goes here
A1 = load('a1.mat');

[YY, XX] = size(image);

nYY = round(YY * yScale);
nXX = round(XX * xScale);

xStep = XX / nXX;
yStep = YY / nYY;

nI = uint8(zeros(nXX, nYY));

for x = 1:nXX-1
    for y = 1:nYY-1
        % Getting safe
        oldY = floor(y * yStep);
        if oldY >= YY
            oldY = YY - 1;
        end
        if oldY == 0
            oldY = 1;
        end
        
        oldX = floor(x * xStep);
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
        a = A1.A1 * double(xCoef);
        aCoef = [a(1), a(5), a(9), a(13); a(2), a(6), a(10), a(14); a(3), a(7), a(11), a(15); a(4), a(8), a(12), a(16)];
        
        % new pixel value
        newPix = [1 xx xx^2 xx^3] * aCoef * [1; yy; yy^2; yy^3];
        
        nI(x, y) = abs(newPix);
    end
end

end

