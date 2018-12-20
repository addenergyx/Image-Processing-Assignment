clear all;
close all;
clc;

addpath('C:\Users\david\OneDrive\Documents\GitHub\Image-Processing-Assignment');  
run('A3_thresholding') %run to get necessary variables
close;

%A4
hand = imread('flat.png');
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
