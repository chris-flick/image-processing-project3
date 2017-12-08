function P = morphoPrun(I, numthin, numdil)
SE(:, :, 1) = [-1, 0, 0; 1, 1, 0; -1, 0, 0];
SE(:, :, 2) = rot90(SE(:, :, 1));
SE(:, :, 3) = rot90(SE(:, :, 2));
SE(:, :, 4) = rot90(SE(:, :, 3));
SE(:, :, 5) = [1, 0, 0; 0, 1, 0; 0, 0, 0];
SE(:, :, 6) = rot90(SE(:, :, 5));
SE(:, :, 7) = rot90(SE(:, :, 6));
SE(:, :, 8) = rot90(SE(:, :, 7));

[m, n, K] = size(SE);
[M, N] = size(I);

paddedI = padarray(I, [m, n], 0, 'both');
T = padarray(I, [m, n], 0, 'both');

P = I;

for i = 1:numthin
    P = morphoThin(I, SE);
end

% hit or miss algorithm
    for x = 1+floor(m/2):2*m+M-floor(m/2)
       for y = 1+floor(n/2):2*n+N-floor(n/2)
           screen = paddedI(x-floor(m/2):x+floor(m/2), y-floor(n/2):y+floor(n/2));
           [x2, y2] = size(screen);
           breakloop = 0;
           
           for i = 1:x2
               for k = 1:y2
                   if B(i, k, z) == -1
                       continue;
                   end
                   
                   % if one of the pixels does not match, break loop
                   if B(i, k, z) ~= screen(i, k)
                       breakloop = 1;
                       break;
                   end
               end
               
               if breakloop == 1
                   break;
               end
           end
           
           % if loop isn't broken, then hit or miss passes, so set to 1
           if breakloop == 0
               T(x, y) = 1;
           else
               T(x,y) = 0;
           end
       end
    end