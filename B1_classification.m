clear all;
close all;
clc;

%B1

hand = uigetfile();
hand = imread(hand);

red = hand(:, :, 1); 
green = hand(:, :, 2); 
blue = hand(:, :, 3); 

orangeTipBinary = red > 94 & green < 73 & blue < 33; 
orangeTipIsolated = hand; 
orangeTipIsolated(repmat(~orangeTipBinary,[1 1 3])) = 0; 

yellowTipBinary = red > 143 & green > 143 & blue < 103;
yellowTipIsolated = hand;
yellowTipIsolated(repmat(~yellowTipBinary,[1 1 3])) = 0;

blueTipBinary = red < 68 & green < 56 & blue > 59;
blueTipIsolated = hand;
blueTipIsolated(repmat(~blueTipBinary,[1 1 3])) = 0;

greenTipBinary = red < 48 & green > 55 & blue < 72;
greenTipIsolated = hand;
greenTipIsolated(repmat(~greenTipBinary,[1 1 3])) = 0;

redTipBinary = red > 111 & green < 66 & blue > 35 & blue < 103;
redTipIsolated = hand;
redTipIsolated(repmat(~redTipBinary,[1 1 3])) = 0;

[yOrangeMean,xOrangeMean] = findCentralCoordinate(orangeTipBinary);
[yBlueMean,xBlueMean] = findCentralCoordinate(blueTipBinary);
[yGreenMean,xGreenMean] = findCentralCoordinate(greenTipBinary);
[yYellowMean,xYellowMean] = findCentralCoordinate(yellowTipBinary);
[yRedMean,xRedMean] = findCentralCoordinate(redTipBinary);

orange2YellowTip = pdist([xOrangeMean,yOrangeMean;xYellowMean,yYellowMean],'euclidean');
orange2BlueTip = pdist([xOrangeMean,yOrangeMean;xBlueMean,yBlueMean],'euclidean');
orange2GreenTip = pdist([xOrangeMean,yOrangeMean;xGreenMean,yGreenMean],'euclidean');
orange2RedTip = pdist([xOrangeMean,yOrangeMean;xRedMean,yRedMean],'euclidean');

distanceMatrix = cat(1,orange2YellowTip,orange2BlueTip,orange2GreenTip,orange2RedTip);

greyScaleHand = rgb2gray(hand);

catGreyScale = cat(3, greyScaleHand, greyScaleHand, greyScaleHand);

greyWithColouredTips = imadd(catGreyScale,orangeTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,redTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,blueTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,greenTipIsolated);
greyWithColouredTips = imadd(greyWithColouredTips,yellowTipIsolated);

imshow(greyWithColouredTips);
hold on;
plot(xOrangeMean, yOrangeMean, 'ro','MarkerSize', 25);
plot(xRedMean, yRedMean, 'ro','MarkerSize', 25);
plot(xBlueMean, yBlueMean, 'ro','MarkerSize', 25);
plot(xGreenMean, yGreenMean, 'ro','MarkerSize', 25);
plot(xYellowMean, yYellowMean, 'ro','MarkerSize', 25);
plot([xOrangeMean xYellowMean], [yOrangeMean yYellowMean],'Color','g','LineWidth', 1)
plot([xYellowMean xBlueMean], [yYellowMean yBlueMean],'Color','g','LineWidth', 1)
plot([xBlueMean xGreenMean], [yBlueMean yGreenMean],'Color','g','LineWidth', 1)
plot([xGreenMean xRedMean], [yGreenMean yRedMean],'Color','g','LineWidth', 1)

[distance,colour] = min(distanceMatrix);

if distance < 700    
    if colour == 1
        disp('Gesture is thumb touching index finger curved down into palm');
    elseif colour == 2
        disp('Gesture is thumb touching middle finger curved down into palm ');
    elseif colour == 3
        disp('Gesture is  thumb touching ring finger curved down into palm ');
    elseif colour == 4
        disp('Gesture is thumb touching little finger curved down into palm');
    end
else
    disp('Gesture is flat hand')
end
        
function [yMean, xMean] = findCentralCoordinate(binaryImage)
    [yCoordinates,xCoordinates] = find(binaryImage);
    xMean = mean(xCoordinates);
    yMean = mean(yCoordinates);
end
