function imageBW = localBinarization(image)
%LOCALBINRIZATION Summary of this function goes here
%   Detailed explanation goes here
[X, Y] = size(image);

imageBW = image;

frame = 14;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,frame/2,image,X,Y);
        if image(i,j) > mean
            imageBW(i,j) = 255;
        else
            imageBW(i,j) = 0;
        end
    end
end
end

