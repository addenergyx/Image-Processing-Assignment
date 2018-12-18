clear all;
close all;
clc;

palmDownImageFile = imread('flat.png');


r = palmDownImageFile(:, :, 1); 
g = palmDownImageFile(:, :, 2); 
b = palmDownImageFile(:, :, 3); 


orangeThumbBinary = r > 142 & r < 208 & g > 68 & g < 109 & b < 54; 
orangeThumbIsolated = palmDownImageFile;
orangeThumbIsolated(repmat(~orangeThumbBinary,[1 1 3])) = 0; 


yellowIndexBinary = r > 174 & r < 235 & g > 142 & g < 206 & b > 33 & b < 108;
yellowIndexIsolated = palmDownImageFile;
yellowIndexIsolated(repmat(~yellowIndexBinary,[1 1 3])) = 0;


blueMiddleBinary = r > 14 & r < 44 & g > 64 & g < 90 & b > 130 & b < 149;
blueMiddleIsolated = palmDownImageFile;
blueMiddleIsolated(repmat(~blueMiddleBinary,[1 1 3])) = 0;


greenRingBinary = r < 12 & g > 93 & g < 130 & b > 97 & b < 130;
greenRingIsolated = palmDownImageFile;
greenRingIsolated(repmat(~greenRingBinary,[1 1 3])) = 0;

redPinkyBinary = r > 200 & r < 223 & g > 99 & g < 136 & b > 84 & b < 119;
redPinkyIsolated = palmDownImageFile;
redPinkyIsolated(repmat(~redPinkyBinary,[1 1 3])) = 0;

figure;
subplot(6,2,1);
imshow(orangeThumbBinary);colormap gray;axis image;title('i. Binary Masks'); 
subplot(6,2,2); 
imshow(orangeThumbIsolated);colormap gray;axis image;title('ii. Isolated Pixels');
subplot(6,2,3);
imshow(yellowIndexBinary);
subplot(6,2,4);
imshow(yellowIndexIsolated);
subplot(6,2,5);
imshow(blueMiddleBinary);
subplot(6,2,6); 
imshow(blueMiddleIsolated);
subplot(6,2,7);
imshow(greenRingBinary);
subplot(6,2,8);
imshow(greenRingIsolated);
subplot(6,2,9);
imshow(redPinkyBinary);
subplot(6,2,10); 
imshow(redPinkyIsolated);



