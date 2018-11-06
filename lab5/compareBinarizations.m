function compareBinarizations(img, threshold)
%COMPAREBINARIZATIONS Summary of this function goes here
%   Detailed explanation goes here
figure;
subplot(2,3,1);
imshow(img);
title('original');
subplot(2,3,2);
imhist(img, 256);
title('histogram');
subplot(2,3,3);
imshow(im2bw(img, threshold));
title(strcat('manual, ', 'threshold: ', num2str(threshold * 256)));
subplot(2,3,4);
thr = otsuthresh(imhist(img, 256));
imshow(im2bw(img, thr / 255));
title(strcat('Otsu, ', 'threshold: ', num2str(thr)));
subplot(2,3,5);
thr = clusterKittler(img);
imshow(im2bw(img, thr/255));
title(strcat('ClusterKittler, ', 'threshold: ', num2str(thr)));
subplot(2,3,6);
thr = entropyYen(img);
imshow(im2bw(img, thr/255));
title(strcat('Yen, ', 'threshold: ', num2str(thr)));
end
