function  gradients(image, mask)
%GRADIENTS Summary of this function goes here
%   Detailed explanation goes here

convoluted = uint8(conv2(image, mask, 'same'));

figure;
subplot(2,2,1);
imshow(convoluted + 128);
title('laplacian with added 128');

subplot(2,2,2);
imshow(abs(convoluted));
title('laplacian filter treated with abs()');

subplot(2,2,3);
imshow(image + convoluted + 128);
title('image with 128');

subplot(2,2,4);
imshow(image + abs(convoluted));
title('image with abs');

end

