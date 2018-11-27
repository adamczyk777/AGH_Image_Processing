function compareForImage(image)
    %% erosion
square = strel('square', 3);
eroded = imerode(image, square);
dilatated = imdilate(image, square);
imopened = imopen(image, square);
imclosed = imclose(image, square);

figure;
subplot(2,3,1)
imshow(eroded);
title('eroded');
subplot(2,3,2);
imshow(dilatated);
title('dilatated');
subplot(2,3,3);
imshow(imopened);
title('im opened');
subplot(2,3,4);
imshow(imclosed);
title('im closed');
subplot(2,3,5);
imshow(image);
title('original');
end

