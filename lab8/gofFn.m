function result = gofFn(nhood)
    if(nhood(2,2))
        sumVal = sum(nhood(:))-1;
        result = (sumVal==2 || sumVal==3);
    end
    if(~nhood(2,2))
        sumVal = sum(nhood(:));
        result = (sumVal==3);
    end
end