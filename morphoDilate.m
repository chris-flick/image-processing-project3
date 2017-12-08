function D = morphoDilate(I, B)

[m, n] = size(B);
[M, N] = size(I);

paddedI = padarray(I, [m, n], 0, 'both');
D = padarray(I, [m, n], 0, 'both');

for x = 1+floor(m/2):2*m+M-floor(m/2)
   for y = 1+floor(n/2):2*n+N-floor(n/2)
       screen = paddedI(x-floor(m/2):x+floor(m/2), y-floor(n/2):y+floor(n/2));

       % checking to see if the sum is greater than 0, if it is
       % then a pixel in the foreground is found, so set to 255
       temp = sum(sum(screen));
       if temp > 0
           D(x,y) = 1;
       else
           D(x,y) = 0;
       end
   end
end

D = D(m+1:M+m, n+1:N+n);