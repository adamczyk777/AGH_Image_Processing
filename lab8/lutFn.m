function result = lutFn(nhood)
%LUTFN Summary of this function goes here
%   Detailed explanation goes here
result = nhood(2,2) & (sum(nhood(:)) == 2);
end

