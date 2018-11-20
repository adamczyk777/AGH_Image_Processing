function data_filtered = bilateral_local(data, localWindow)
%BILATERAL_LOCAL Summary of this function goes here
%   Detailed explanation goes here
Nx = size(data,2);
Ncy = ceil(localWindow(1)/2);
Ncx = ceil(localWindow(2)/2);
sigma = 3;

data_filtered = size(data);

h = fspecial('gaussian', localWindow, 25);

for i = 1:Nx
    patch = reshape(data(:, i), localWindow);
    
    [rows, cols] = find(patch == patch);
    rows = ceil(reshape(rows, localWindow));
    cols = ceil(reshape(cols, localWindow));
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    dist = dist .* h;
    abs_val = abs(patch - patch(Ncy,Ncx));
    
    gamma = exp(((-1)*(abs_val).^2)/2*(sigma)^2);
    
    data_filtered(i) = sum(sum(dist .* gamma .* patch)) / sum(sum(dist .* gamma));
end
end