function ang = edgeAngle(f, type, T)

switch type
    case 'prewitt'
        gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
        gy = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
        
        a = atan(gy./gx);
        a(2, 2) = 0;
        ang = imfilter(f, a, 'replicate');
        
%         GX = imfilter(f, gx, 'replicate');
%         GY = imfilter(f, gy, 'replicate');
%         
%         ang = atan(double(GX)./double(GY));
    case 'sobel'
        gx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
        gy = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
        
        a = atan(gy./gx)
        a(2, 2) = 0;
        ang = imfilter(f, a, 'replicate');
        
        
    otherwise
        disp('incorrect type entered')
        
end