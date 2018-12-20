clear all;
close all;
clc;

addpath('C:\Users\david\OneDrive\Documents\GitHub\Image-Processing-Assignment'); %Add script folder to search path to avoid repeating code  
run('A3_thresholding') %run to get necessary variables
close; % Close figures created by script

%A4
hand = uigetfile();
hand = imread(hand);
greyScaleHand = rgb2gray(hand);

catGreyScale = cat(3, greyScaleHand, greyScaleHand, greyScaleHand);

greyWithColouredTips = imadd(catGreyScale,orangeTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,redTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,blueTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,greenTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,yellowTipIsolated);
imshow(greyWithColouredTips);

orangeCardinality = sum(orangeTipBinary(:) == 1);
redCardinality = sum(redTipBinary(:) == 1);
blueCardinality = sum(blueTipBinary(:) == 1);
greenCardinality = sum(greenTipBinary(:) == 1);
yellowCardinality = sum(yellowTipBinary(:) == 1);

report = ['Size of orange fingertip pixels cluster: ', num2str(orangeCardinality) ];
disp(report);
report = ['Size of yellow fingertip pixels cluster: ', num2str(yellowCardinality) ];
disp(report);
report = ['Size of blue fingertip pixels cluster: ', num2str(blueCardinality) ];
disp(report);
report = ['Size of green fingertip pixels cluster: ', num2str(greenCardinality) ];
disp(report);
report = ['Size of red fingertip pixels cluster: ', num2str(redCardinality) ];
disp(report);








