function g = edgeMag(f, type, T)
[M N] = size(f);

switch type
    case 'prewitt'
        gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
        gy = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
        
        GX = imfilter(f, gx, 'replicate');
        GY = imfilter(f, gy, 'replicate');
       
        g = abs(GX) + abs(GY);
        
        threshold = T * 255;
        for i = 1:M
            for j = 1:N
                if g(i,j) <= threshold
                    g(i,j) = 0;
                end
            end
        end
        
    case 'sobel'
        gx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
        gy = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
        
        GX = imfilter(f, gx, 'replicate');
        GY = imfilter(f, gy, 'replicate');
        
        g = abs(GX) + abs(GY);
        
        threshold = T * 255;
        for i = 1:M
            for j = 1:N
                if g(i,j) <= threshold
                    g(i,j) = 0;
                end
            end
        end
    otherwise
        disp('incorrect type')
        return
end