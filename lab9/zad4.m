% Jakub Adamczyk
%% Preparation
clear;
clc;
close all;

%% images

lab112 = imread('lab112.png');
dom = imread('dom.png');
image = lab112;

%% Task

figure;
imshow(image);

T = 40;
image(image < T) = 0;
image(image > T) = 255;

% delete vertical lines

square = strel('square', 5);

image = imclose(image, square);

edges = edge(image, 'canny');

[H, T, R] = hough(edges);

figure;
imshow(H, []);
P = houghpeaks(H, 8);
hold on;
plot(P, 'o');

lines = houghlines(edges, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure, imshow(edges), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

image = dom;

figure;
imshow(image);

edges = edge(image, 'canny');

[H, T, R] = hough(edges);

figure;
imshow(H, []);
P = houghpeaks(H, 8);
hold on;
plot(P, 'o');

lines = houghlines(edges, T, R, P, 'FillGap', 5, 'MinLength', 7);
figure, imshow(edges), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
