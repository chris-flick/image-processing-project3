function [g, sep, kstar] = otsuThresh(f)

histogram = zeros(1, 256);
[M, N] = size(f);

for i = 1:M
    for j = 1:N
        histogram(1, f(i,j)) = histogram(1, f(i,j)) + 1;
    end
end

nmhist = histogram./(M * N);

max = 0;
kstar = 1;
for z=1:255
    k = z;
    
    P1 = 0;
    % calculating probability of occurrence in C1
    for i = 1:k
        P1 = P1 + nmhist(1, i);
    end
    P2 = 1 - P1;

    % calculating mean intensity value of pixels in C1
    m1 = 0;
    for i = 1:k
       m1 = i * nmhist(1, i); 
    end

    m1 = m1 / P1;

    % calculating mean intensity value of pixels in C2
    m2 = 0;
    for i = k+1:255
       m2 = i * nmhist(1, i); 
    end

    m2 = m2 / P2;
    
    
    % calculating the average intensity of the entire image
    mg = P1*m1 + P2*m2;

    % calculating between class variance
    ob = P1*(m1 - mg).^2 + P2*(m2 - mg).^2;
    
    if ob > max
        max = ob;
        kstar = z;
    end
end

% iterate through image and apply thresholding
for i = 1:M
    for j = 1:N
        if f(i,j) > kstar
            f(i,j) = 255;
        else
            f(i,j) = 0;
        end
    end
end

% calculating the average intensity of the entire image
mg = 0;
for i = 1:256
    mg = mg + i * nmhist(1, i); 
end

% calculating global variance
og = 0;
for i = 1:256
    og = ((i - mg).^2) * nmhist(1, i);
end

g = f;
sep = ob/og;

