function image = indexate(originalImage)

    image = originalImage;

    [height, width] = size(originalImage);

    % label
    L = 1;

    for y = 2 : (height-1)
        for x = 2 : (width-1)
            if image(y, x) == 255
                neighbors = [image(y-1,x-1) image(y-1,x) image(y-1,x+1) image(y,x-1)];
                suma = sum(neighbors);
                if suma == 0
                    image(y, x) = L;
                    L = L+1;
                elseif suma > 0
                    nonzero = nonzeros(neighbors);
                    min_ = min(nonzero);
                    max_ = max(nonzero);
                    if min_ == max_
                        image(y, x) = min_;
                    else
                        image(y, x) = min_;
                    end
                end 
            end
        end
    end
end

