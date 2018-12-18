clear all;
close all;
clc;

%A3
hand = imread('flat.png');
%imtool(hand); %used to help find thresholds

redHand = hand(:, :, 1); 
greenHand = hand(:, :, 2); 
blueHand = hand(:, :, 3); 

orangeTipBinary = redHand > 112 & redHand < 148 & greenHand > 50 & greenHand < 90 & blueHand < 50; 
orangeTipIsolated = hand; 
orangeTipIsolated(repmat(~orangeTipBinary,[1 1 3])) = 0; 

yellowTipBinary = redHand > 174 & redHand < 235 & greenHand > 142 & greenHand < 206 & blueHand > 33 & blueHand < 108;
yellowTipIsolated = hand;
yellowTipIsolated(repmat(~yellowTipBinary,[1 1 3])) = 0;


blueTipBinary = redHand < 37 & greenHand > 40 & greenHand < 83 & blueHand > 80;
blueTipIsolated = hand;
blueTipIsolated(repmat(~blueTipBinary,[1 1 3])) = 0;


greenTipBinary = redHand < 45 & greenHand > 79 & blueHand < 120 & blueHand > 55;
greenTipIsolated = hand;
greenTipIsolated(repmat(~greenTipBinary,[1 1 3])) = 0;

redTipBinary = redHand > 173 & greenHand > 80 & greenHand < 150 & blueHand > 60 & blueHand < 125;
redTipIsolated = hand;
redTipIsolated(repmat(~redTipBinary,[1 1 3])) = 0;

figure;
subplot(6,2,1);
imshow(orangeTipBinary);colormap gray;axis image;title('i. Binary Masks'); 
subplot(6,2,2); 
imshow(orangeTipIsolated);colormap gray;axis image;title('ii. Isolated Pixels');
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






