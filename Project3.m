%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 3.1
open aMean.m
open scaleImage.m
open geoMean.m
open medianFilter.m
open ctharMean.m

circuitBoardGaussian = imread('circuitboard_gaussian.tif');
saltcircuitboard = imread('circuitboard_salt.tif');
peppercircuitboard = imread('circuitboard_pepper.tif');
saltpeppercircuitboard = imread('cirbuitboard_saltandpepper.tif');

% perform arithmetic mean filtering and scale image
% arith = aMean(circuitBoardGaussian, 3, 3);
% 
% % perform geometric mean filtering and scale image
% geo = geoMean(circuitBoardGaussian, 3, 3);
% geo = scaleImage(geo);
% 
% imshow(uint8(arith))
% title('circuit board gaussian filtered by 3x3 arithmetic mean filter')
% pause
% 
% imshow(uint8(geo))
% title('circuit board gaussian filtered by 3x3 geometric mean filter')
% pause
% 
% contrasalt = ctharMean(saltcircuitboard, 3, 3, -1.5);
% contrasalt = scaleImage(contrasalt);
% 
% imshow(uint8(contrasalt))
% title('salty circuit board filtered by 3x3 contraharmonic mean filter with Q = -1.5')
% pause
% 
% contrapepper = ctharMean(peppercircuitboard, 3, 3, 1.5);
% contrapepper = scaleImage(contrapepper);
% 
% imshow(uint8(contrapepper))
% title('peppery circuit board filtered by 3x3 contraharmonic mean filter with Q = 1.5')
% pause
% 
% median = medianFilter(saltpeppercircuitboard, 3, 3);
% 
% imshow(uint8(median))
% title('salt and pepper circuit board filtered by 3x3 median filter')
% pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 3.2

open morphoErode.m
open morphoDilate.m

% B = [1 1 1; 1 1 1; 1 1 1];
% 
UTK = imbinarize(imread('UTK.tif'), 0.4);
% 
% E = morphoErode(UTK, B);
% E = morphoErode(E, B);
% E = morphoErode(E, B);
% 
% D = morphoDilate(UTK, B);
% D = morphoDilate(D, B);
% D = morphoDilate(D, B);
% 
% imshow(E);
% title('erosion of UTK three times')
% pause
% 
% imshow(D);
% title('dilation of UTK three times')
% pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 3.3

open morphoThin.m
open morphoPrun.m

% A = [
%     1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
%     1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0;
%     1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0;
%     1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0;
%     1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0;];
% 
% B(:, :, 1) = [0, 0, 0; -1, 1, -1; 1, 1, 1];
% B(:, :, 2) = [-1, 0, 0; 1, 1, 0; 1, 1, -1];
% B(:, :, 3) = [1, -1, 0; 1, 1, 0; 1, 1, -1];
% B(:, :, 4) = [1, 1, -1; 1, 1, 0; -1, 0, 0];
% B(:, :, 5) = [1, 1, 1; -1, 1, -1; 0, 0, 0];
% B(:, :, 6) = [-1, 1, 1; 0, 1, 1; 0, 0, -1];
% B(:, :, 7) = [0, -1, 1; 0, 1, 1; 0, -1, 1];
% B(:, :, 8) = [0, 0, -1; 0, 1, 1; -1, 1, 1]; 
% 
% T = morphoThin(UTK, B);
% 
% imshow(T);
% title('thinning of UTK with all SE in Fig 9.21')
% pause
% 
% P = morphoPrun(T, 3, 1);
% imshow(P)
% title('pruning of UTK')
% pause


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 3.4