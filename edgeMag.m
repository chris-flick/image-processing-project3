function g = edgeMag(f, type, T)

switch type
    case 'prewitt'
        gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
        gy = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
        
        GX = imfilter(f, gx, 'replicate');
        GY = imfilter(f, gy, 'replicate');
        
        g = abs(GX) + abs(GY);
        
    case 'sobel'
        gx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
        gy = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
        
        GX = imfilter(f, gx, 'replicate');
        GY = imfilter(f, gy, 'replicate');
        
        g = abs(GX) + abs(GY);
    otherwise
        disp('incorrect type')
        return
end