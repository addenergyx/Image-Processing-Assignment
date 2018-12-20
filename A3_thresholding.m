clear all;
close all;
clc;

%A3
hand = imread('flat.png');
%imtool(hand); %used to help find thresholds

red = hand(:, :, 1); 
green = hand(:, :, 2); 
blue = hand(:, :, 3); 

orangeTipBinary = red > 110 & red < 146 & green > 59 & green < 90 & blue < 46 & blue > 14; 
orangeTipIsolated = hand; 
orangeTipIsolated(repmat(~orangeTipBinary,[1 1 3])) = 0; 

yellowTipBinary = green > 113 & blue < 79;
yellowTipIsolated = hand;
yellowTipIsolated(repmat(~yellowTipBinary,[1 1 3])) = 0;

blueTipBinary = red < 64 & green < 93 & blue > 95;
blueTipIsolated = hand;
blueTipIsolated(repmat(~blueTipBinary,[1 1 3])) = 0;

greenTipBinary = red < 78 & green > 90 & blue < 111 & blue > 54;
greenTipIsolated = hand;
greenTipIsolated(repmat(~greenTipBinary,[1 1 3])) = 0;

redTipBinary = red > 173 & green > 80 & green < 150 & blue > 60 & blue < 125;
redTipIsolated = hand;
redTipIsolated(repmat(~redTipBinary,[1 1 3])) = 0;

figure;
subplot(6,2,1);
imshow(orangeTipBinary);colormap gray;axis image;title('Binary Masks'); 
subplot(6,2,2); 
imshow(orangeTipIsolated);colormap gray;axis image;title('Isolated Pixels');
subplot(6,2,3);
imshow(yellowTipBinary);
subplot(6,2,4);
imshow(yellowTipIsolated);
subplot(6,2,5);
imshow(blueTipBinary);
subplot(6,2,6); 
imshow(blueTipIsolated);
subplot(6,2,7);
imshow(greenTipBinary);
subplot(6,2,8);
imshow(greenTipIsolated);
subplot(6,2,9);
imshow(redTipBinary);
subplot(6,2,10); 
imshow(redTipIsolated);





