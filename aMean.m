function f_hat = aMean(g, m, n)

h = 1/(m*n) .* ones(m,n);
f_hat = imfilter(g, h, 'replicate');

