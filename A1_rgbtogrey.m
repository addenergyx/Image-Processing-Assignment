clear all;
close all;
clc;

%A1
hand = uigetfile();
hand = imread(hand);

%rgb2gray uses luminosity conversion
%0.2989 * R + 0.5870 * G + 0.1140 * B
%0.21R + 0.72G + 0.07B - in class values
greyScaleHand = rgb2gray(hand);

figure;
subplot(1,2,1); 
imagesc(hand);colormap gray;axis image;title('Image A - RGB');
subplot(1,2,2); 
imagesc(greyScaleHand);colormap gray;axis image;title('Image B - Greyscale');


