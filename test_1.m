clc; clear all; close all;

rgb = imread('rice.png');
I = (rgb);
imshow(I)

% Step 2: Use the Gradient Magnitude as the Segmentation Function
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure, imshow(gradmag,[]), title('Gradient magnitude (gradmag)')

L = watershed(gradmag);
Lrgb = label2rgb(L);
figure, imshow(Lrgb), 
title('Watershed transform of gradient magnitude (Lrgb)')

% Step 3: Mark the Foreground Objects
se = strel('disk', 20);
Io = imopen(I, se);
figure, imshow(Io), title('Opening (Io)')

% compute the opening-by-reconstruction using imerode and imreconstruct
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
figure, imshow(Iobr), title('Opening-by-reconstruction (Iobr)')

% Compare a regular morphological closing with a closing-by-reconstruction
Ioc = imclose(Io, se);
figure, imshow(Ioc), title('Opening-closing (Ioc)')


% image inputs and output of imreconstruct.
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure, imshow(Iobrcbr), title('Opening-closing by reconstruction (Iobrcbr)')


% calculate the regional maxima of Iobrcbr to obtain good foreground
% markers.
fgm = imregionalmax(Iobrcbr);
figure, imshow(fgm), 
title('Regional maxima of opening-closing by reconstruction (fgm)')

% superimpose the foreground marker image on the original image.
I2 = I; I2(fgm) = 255;
figure, imshow(I2), 
title('Regional maxima superimposed on original image (I2)')






