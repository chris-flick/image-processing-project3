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


X2 = zeros(M, N);

X1 = I;

% Step 1 - thin the image using the SEs
for i = 1:numthin
    X1 = morphoThin(I, SE);
end

% step 2 - Union of the hit or miss of each SE to find endpoints
paddedI = padarray(X1, [m, n], 0, 'both');
T = padarray(X1, [m, n], 0, 'both');

% hit or miss algorithm with each SE
for z = 1:K
    for x = 1+floor(m/2):2*m+M-floor(m/2)
       for y = 1+floor(n/2):2*n+N-floor(n/2)
           screen = paddedI(x-floor(m/2):x+floor(m/2), y-floor(n/2):y+floor(n/2));
           [x2, y2] = size(screen);
           breakloop = 0;
           
           for i = 1:x2
               for k = 1:y2
                   if SE(i, k, z) == -1
                       continue;
                   end
                   
                   % if one of the pixels does not match, break loop
                   if SE(i, k, z) ~= screen(i, k)
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
    
    % Union of the hit or miss
    X2 = X2 | T(m+1:M+m, n+1:N+n);
end

% step 3 - dilate the end points and find intersection of it with original
% image
for i = 1:numdil
   for j = 1:K
       X2 = morphoDilate(X2, SE(:, :, K)); 
   end
end

X3 = X2 & I;

% step 4 - find Union of X1 and X3
X4 = X3 | X1;

P = X4;