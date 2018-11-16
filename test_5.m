
clc; clear all; close all;

BW1 = imread('circbw.tif');
imshow(BW1);figure

% Skeletonize objects in the image using the bwskel function.
BW2 = bwskel(BW1);
imshow(BW2);figure

% Find the perimeters of objects in the image.
BW3 = bwperim(BW1);
imshow(BW3);