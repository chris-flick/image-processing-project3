function ang = edgeAngle(f, type, T)
[M N] = size(f);

switch type
    case 'prewitt'
        gx = [-1, -1, -1; 0, 0, 0; 1, 1, 1];
        gy = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
        
        a = atan(gy./gx);
        a(2, 2) = 0;
        ang = imfilter(f, a, 'replicate');
        
        threshold = T * 255;
        for i = 1:M
            for j = 1:N
                if ang(i,j) <= threshold
                    ang(i,j) = 0;
                end
            end
        end
        
%         GX = imfilter(f, gx, 'replicate');
%         GY = imfilter(f, gy, 'replicate');
%         
%         ang = atan(double(GX)./double(GY));
    case 'sobel'
        gx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
        gy = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
        
        a = atan(gy./gx);
        a(2, 2) = 0;
        ang = imfilter(f, a, 'replicate');
        
        threshold = T * 255;
        for i = 1:M
            for j = 1:N
                if ang(i,j) <= threshold
                    ang(i,j) = 0;
                end
            end
        end
    otherwise
        disp('incorrect type entered')
        
end