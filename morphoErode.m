function E = morphoErode(I, B)

[m, n] = size(B);
[M, N] = size(I);

paddedI = padarray(I, [m, n], 0, 'both');
E = padarray(I, [m, n], 0, 'both');

for x = m+1:m+M
   for y = n+1:n+N
       screen = paddedI(x-floor(m/2):x+floor(m/2), y-floor(n/2):y+floor(n/2));
       
       
       % since image isn't binary, i'm checking for any 0's
       % if a 0 is found, then a pixel from background is included so
       % set the pixel to 0
       answer = all(all(screen));
       
       if answer == 1
           E(x,y) = 1;
       else
           E(x,y) = 0;
       end
       
   end
end

E = E(m+1:M+m, n+1:N+n);



