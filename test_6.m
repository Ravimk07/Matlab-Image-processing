clc; clear all; close all;
A=imread('download.png'); %Read in binary image
imshow(A);

% edtImage = bwdist(A);
% maxDiam = 2 * max(edtImage(:));  % Max() will give the radius.

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(A), hy, 'replicate');
Ix = imfilter(double(A), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure, imshow(gradmag,[]), title('Gradient magnitude (gradmag)')

perimet=bwperim(A); 
figure, imshow(perimet)

bw = imbinarize(A);
stats = regionprops('table',bw,'Centroid',...
    'MajorAxisLength','MinorAxisLength')

centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;
