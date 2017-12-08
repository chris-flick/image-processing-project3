function g = scaleImage(im)

%% scale image
gm = im - min(min(im));

% scale image
gs = 255*(gm./max(max(gm)));

g = gs;