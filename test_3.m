clc; clear all; close all;
BW = imread('text.png');
imshow(BW);

CC = bwconncomp(BW)

numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
BW(CC.PixelIdxList{idx}) = 0;

figure
imshow(BW)