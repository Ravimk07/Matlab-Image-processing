clc; clear all; close all;
% A=imread('bar.png'); %Read in binary image
A=imread('download.png'); %Read in binary image
imshow(A);
bw = imbinarize(A);
% bw = imbinarize(A(:,:,1));
Image = bw;
[m,n]=size(bw);

[row,col]=size(bw);
half_row=round(row/2);
half_col=round(col/2);

r2 = ceil(half_row/2);
r3 = ceil(r2/2);
r4 = ceil((half_row+r3));
r5 = ceil((half_row+r2));

I_hoz_pixel=zeros(1,col);
% z=zeros(1,row);

center=bw(half_row,:);
down=bw(r2,:);
down1=bw(r3,:);
up=bw(r4,:);
up1=bw(r5,:);
% plot(I_hoz_pixel)
Image(half_row:half_row+3,:) = 0;
Image(r2:r2+3,:) = 0;
Image(r3:r3+3,:) = 0;
Image(r4:r4+3,:) = 0;
Image(r5:r5+3,:) = 0;
% Image(r2:r2+3,:) = 0;
% Image(r3:r3+3,:) = 0;
figure;
imshow((Image));
% th=max(I_hoz_pixel)*0.06;
% if z_plane(1,half_col)>th %case1:no notch if we traverse verticall

for j=1:n-1
    center_loc(j)=abs(center(j+1)-center(j));      %----first derivatives
    down_loc(j)=abs(down(j+1)-down(j));      %----first derivatives
    down_loc1(j)=abs(down1(j+1)-down1(j));      %----first derivatives
    up_loc(j)=abs(up(j+1)-up(j));      %----first derivatives
    up1_loc1(j)=abs(up1(j+1)-up1(j));      %----first derivatives
end
k = find(center_loc,4,'last');
k1 = find(down_loc,4,'last');
k2 = find(down_loc1,4,'last');
k3 = find(up_loc,4,'last');
k4 = find(up1_loc1,4,'last');

kdiff = k(2)-k(1);k1diff = k1(2)-k1(1);k2diff = k2(2)-k2(1);
k3diff = k3(2)-k3(1);k4diff = k4(2)-k4(1);
% [c, I] = max(z(1,:));
% N = nnz(z)
dpoints(:,:) = [kdiff k1diff k2diff k3diff k4diff];
dpoint1 = var(dpoints);
% [uu,tu] = max(dpoints);
% final = final_valley_locations(1,tu);




% edtImage = bwdist(A);
% maxDiam = 2 * max(edtImage(:));  % Max() will give the radius.

% hy = fspecial('sobel');
% hx = hy';
% Iy = imfilter(double(A), hy, 'replicate');
% Ix = imfilter(double(A), hx, 'replicate');
% gradmag = sqrt(Ix.^2 + Iy.^2);
% figure, imshow(gradmag,[]), title('Gradient magnitude (gradmag)')

