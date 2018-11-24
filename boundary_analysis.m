clear all; close all; clc

im = im2double(imread('strip1.png'));
im = imresize(im,[378 140]);
% im = im2double(imread('rope1.jpg'));
% im = rgb2gray(im);
% im = imresize(im,[256 256]);
[r,c] = size(im);
imshow(im);

thresh = graythresh(im);
BWfinal = im2bw(im, thresh); 

% BWfinal = imcomplement(BWfinal);
se = strel('disk', 15);
BWfinal = imclose(BWfinal, se);
% figure;
% imshow(BWfinal);

se= strel('disk', 4);
img_dilated = imdilate(BWfinal, se) ;
img_eroded = imerode(BWfinal, se) ;
edge1 = img_dilated - BWfinal;
figure;
imshow(edge1);
% edge1 = imrotate(edge1,90);
% [r,c] = size(edge1);

for j=1:r

Ib = edge1(j,:);
    
     for s=1:1:c-1
         if Ib(1,s)==0 && Ib(1,s+1)==1
             X1=s+1;
             break;
         else
             X1=[];
         end; 

     end;
 
      for s=1:1:c-1
         if Ib(1,s)==1 && Ib(1,s+1)==0
             X2=s+1;
%          else
%              X2=[];
         end; 

      end;

      if isempty(X1)
          a=2;
      else
          Y(j) = abs((X1-X2));
      end;
          

end;

plot(Y);
xlim([0 r]);
ylim([0 max(Y)+30]);

