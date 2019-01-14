function modifiedArray = union(p, q, array)
%ROOT Summary of this function goes here
%   Detailed explanation goes here
modifiedArray = array;

startId = p;
endId = q;

if startId > endId
    startId = q;
    endId = p;
end

modifiedArray(rootIndex(startId, array)) = rootIndex(endId, array);
end

