%% iminfo
imfinfo('lena.bmp')
imfinfo('lena.jpg')

%% read images
lena_bmp = imread('lena.bmp');
lena_jpg = imread('lena.jpg');

%% display images
figure;
imshow(lena_bmp);

figure;
imshow(lena_jpg);

%% conversion to grey
lena_bmp_grey = 