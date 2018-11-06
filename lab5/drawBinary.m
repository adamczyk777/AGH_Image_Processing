function x = drawBinary(image, threshold)
%DRAWBINARY Summary of this function goes here
%   Detailed explanation goes here

x = 1;

binaryImage = im2bw(image, threshold);
figure;
subplot(1,3,1);
imshow(image);
title('original image');
subplot(1,3,2);
imhist(image, 256);
title('histogram');
subplot(1,3,3);
imshow(binaryImage);
title('binarised image');

end

