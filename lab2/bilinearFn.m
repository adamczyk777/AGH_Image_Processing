function nI = bilinearFn(image, xScale, yScale)
%BILINEARFN Summary of this function goes here
%   Detailed explanation goes here

[YY, XX] = size(image);

nYY = round(YY * yScale);
nXX = round(XX * xScale);

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

end

