
clc; clear all; close all;
A=imread('circles.png'); %Read in binary image
bw=bwperim(A); %Calculate perimeter
se=strel('disk',5); 
bw1=imerode(A,se); %se allows thick perimeter extraction
subplot(1,3,1), imshow(A);
subplot(1,3,2), imshow(bw);
subplot(1,3,3), imshow(bw); %Display results