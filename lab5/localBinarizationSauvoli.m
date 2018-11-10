function imageBW = localBinarizationSauvoli(image, k, R, frame)
%LOCALBINARIZATIONSAUVOLI Summary of this function goes here
%   Detailed explanation goes here
[X, Y] = size(image);

imageBW = image;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i, j, floor(frame/2), image, X, Y);
        sd = stddevLT(i, j, floor(frame/2), image, mean, X, Y);
        threshold = mean * (1 + k *(sd/R - 1));
        if image(i,j) > threshold
            imageBW(i,j) = 255;
        else
            imageBW(i,j) = 0;
        end
    end
end

end

