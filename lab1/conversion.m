%% image conversion
lena = imread('lena_gray.bmp');
[X, map] = gray2ind(lena, 256);

%% colormap gray
figure;
imshow(X, map);

%% colormap summer
figure;
map_2 = colormap(summer);
imshow(X, map_2);