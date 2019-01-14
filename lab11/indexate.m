function image = indexate(originalImage)

    image = originalImage;

    [height, width] = size(originalImage);
    L = 1;
    N = 100;
    id = 1:N;
    lut = zeros(N);

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
                        minNeighbors = nonzero(nonzero~=min_);
                        minimalNeighbor = min(minNeighbors);

                        id = union(min_, minimalNeighbor, id);
                    end
                end 
            end
        end
    end

    imCopy = image;

    for i = 1:N
        lut(i) = rootIndex(i, id);
    end
    
    for y = 2:(height-1)
        for x = 2:(width-1)
           if (image(y,x) > 0)
             image(y,x) = lut(imCopy(y,x));
           end
        end
     end
     
     figure;
     subplot(1,2,1);
     imshow(imCopy, []);
     title('before lut op');
     subplot(1,2,2);
     imshow(image, []);
     title('after lut op');

end
