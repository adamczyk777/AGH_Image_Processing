function rootIndex = rootIndex(index, array)
%UNION Summary of this function goes here
%   Detailed explanation goes here
rootIndex = index;

while rootIndex ~= array(rootIndex)
    rootIndex = array(rootIndex);
end
end

