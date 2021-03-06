function fourierHelper(image)
%FOURIERHELPER Summary of this function goes here
%   Detailed explanation goes here
%% transformate
fourier = fft2(image);

shifted = fftshift(fourier);
amplitude = log10(abs(shifted)+1);
phase = angle(shifted.*(amplitude>0.0001));

figure;
subplot(1,3,1);
imshow(image);
title('original image');
subplot(1,3,2);
imshow(amplitude, []);
title('amplitude');
subplot(1,3,3)
imshow(phase, []);
title('phase');

%% reverting
unshifted = ifftshift(shifted);
unfourier = ifft2(unshifted);

figure;
subplot(1,2,1);
imshow(image);
title('original');
subplot(1,2,2);
imshow(unfourier);
title('undone');

end

