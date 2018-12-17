function split(image, xS, yS, xE, yE)
    global sLimit vLimit segRes index MRes
    
    subImage = image(yS:yE,xS:xE);
    meanValue = mean(subImage(:));
    stdevValue = std(subImage(:));
    
    if (stdevValue < vLimit) || ((xE - xS) <= sLimit)
        index=index + 1;
        segRes(yS:yE, xS:xE) = index;
        MRes(yS:yE, xS:xE) = meanValue;
    else
        splitX = floor((xE + xS) / 2);
        splitY = floor((yE + yS) / 2);
        
        % recursive call for 4 new Images I1 I2 I3 I4
        split(image, xS, yS, splitX, splitY);
        split(image, splitX + 1, yS, xE, splitY);
        split(image, splitX + 1, splitY + 1, xE, yE);
        split(image, xS, splitY + 1, splitX, yE);
    end
end

