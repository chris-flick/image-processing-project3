function f_hat = medianFilter(g, m, n)

f_hat = medfilt2(g, [m n]);