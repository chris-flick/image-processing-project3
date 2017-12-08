% using -1 to designate Don't care values in SE

function T = morphoThin(I, B)

[m, n, K] = size(B);
[M, N] = size(I);

paddedI = padarray(I, [m, n], 0, 'both');
T = padarray(I, [m, n], 0, 'both');

for z = 1:K
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
           
           % if loop isn't broken, then hit or miss passes, so set to 0
           if breakloop == 0
               T(x, y) = 0;
           end
           
       end
    end
    paddedI = T;
end

T = T(m+1:M+m, n+1:N+n);