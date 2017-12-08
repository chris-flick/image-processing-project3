function f_hat = geoMean(g, m, n)

g = im2double(g);

f_hat = exp(imfilter(log(g), ones(m, n), 'replicate'));
f_hat = f_hat.^(1/(m*n));
