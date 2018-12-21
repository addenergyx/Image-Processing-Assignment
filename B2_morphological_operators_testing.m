clear all;
close all;
clc;

%B2

hand = imread('flat.png');

% hand = uigetfile();
% hand = imread(hand);

red = hand(:, :, 1); 
green = hand(:, :, 2); 
blue = hand(:, :, 3); 

greenTipBinary = red < 78 & green > 90 & blue < 111 & blue > 54;
greenTipIsolated = hand;
greenTipIsolated(repmat(~greenTipBinary,[1 1 3])) = 0;

%structuring element
%se = strel('disk',2 , 0);
%se = strel('disk',10 , 0);
se = strel('line',90 , 20);
%se = strel('diamond',1);
%se = strel('square',50);

greenTipBinaryDilated = imdilate(greenTipBinary, se);
greenTipBinaryClose = imclose(greenTipBinary, se);    

figure;
subplot(3,2,1);
imshow(greenTipBinary);colormap gray;axis image;title('Green tip binary'); 
subplot(3,2,2); 
imshow(greenTipBinaryDilated);colormap gray;axis image;title('Green tip binary Dilation Morphology');
subplot(3,2,3); 
imshow(greenTipBinaryClose);colormap gray;axis image;title('Green tip binary Closing Morphology');

    
    
    
    
    
