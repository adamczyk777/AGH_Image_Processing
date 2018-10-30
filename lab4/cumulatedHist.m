function [H, x, C] = cumulatedHist(hist)
%HISTS Summary of this function goes here
%   Detailed explanation goes here
[H, x] = imhist(hist);
tmpC = cumsum(H);
k = max(tmpC)/max(H);
C = tmpC/k;
end

