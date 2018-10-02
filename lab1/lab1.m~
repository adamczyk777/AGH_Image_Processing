clearvars;
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
lena_bmp_gray = rgb2gray(lena_bmp);

figure;
imshow(lena_bmp_gray);

imwrite(lena_bmp_gray, 'lena_gray.bmp');

colormap gray
figure;
mesh(lena_bmp_gray);

figure;
plot(lena_bmp_gray(10,:));
