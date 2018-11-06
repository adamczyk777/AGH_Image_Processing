function C = cumulate(H)
%CUMULATE Summary of this function goes here
%   Detailed explanation goes here

tmpC = cumsum(H);
k = max(tmpC)/max(H);
C = tmpC/k;
end

