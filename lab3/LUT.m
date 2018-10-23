function LUT (image, encode)
    subplot(2,2,3);
    imshow(image);
    title('Original');
    subplot(2,2,1:2); 
    plot(encode); 
    title('Encode');
    subplot(2,2,4); 
    imshow(intlut(image,encode)); 
    title('Encoded image');
end