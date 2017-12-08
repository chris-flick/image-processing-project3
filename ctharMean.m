function f_hat = ctharMean(g, m, n, q)

g = im2double(g);

top = imfilter(g.^(q+1), ones(m, n), 'replicate');
bottom = imfilter(g.^q, ones(m, n), 'replicate');

f_hat = top./bottom;