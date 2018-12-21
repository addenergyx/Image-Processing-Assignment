clear all;
close all;
clc;

addpath('C:\Users\david\OneDrive\Documents\GitHub\Image-Processing-Assignment');  
run('A4_cardinality')
close;

%A5

[yOrangeMean,xOrangeMean] = findCentralCoordinate(orangeTipBinary);
[yBlueMean,xBlueMean] = findCentralCoordinate(blueTipBinary);
[yGreenMean,xGreenMean] = findCentralCoordinate(greenTipBinary);
[yYellowMean,xYellowMean] = findCentralCoordinate(yellowTipBinary);
[yRedMean,xRedMean] = findCentralCoordinate(redTipBinary);

imshow (greyWithColouredTips)
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

%Euclidean distance between each adjacent pair of fingertips
orange2YellowTip = pdist([xOrangeMean,yOrangeMean;xYellowMean,yYellowMean],'euclidean');
yellow2BlueTip = pdist([xYellowMean,yYellowMean;xBlueMean,yBlueMean],'euclidean');
blue2GreenTip = pdist([xBlueMean,yBlueMean;xGreenMean,yGreenMean],'euclidean');
green2RedTip = pdist([xGreenMean,yGreenMean;xRedMean,yRedMean],'euclidean');

% colours = ["Orange"; "Yellow"; "Green"; "Blue"; "Red"];
% 
% for k=1:length(colours)
%     colour =colours{k};
%     x = ['x',colour,'Mean'];
%     y = ['y',colour,'Mean'];
%     
%     report = ['Coordinate of ', colour, ' average pixel is ', num2str(round(x)), ' ' ,num2str(round(y)) ];
%     disp(report)
% end

report = ['Coordinate of Orange average pixel is ', num2str(round(xOrangeMean)), ' ' ,num2str(round(yOrangeMean)) ];
disp(report);
report = ['Coordinate of Yellow average pixel is ', num2str(round(xYellowMean)), ' ' ,num2str(round(yYellowMean)) ];
disp(report);
report = ['Coordinate of Blue average pixel is ', num2str(round(xBlueMean)), ' ' ,num2str(round(yBlueMean)) ];
disp(report)
report = ['Coordinate of Green average pixel is ', num2str(round(xGreenMean)), ' ' ,num2str(round(yGreenMean)) ];
disp(report);
report = ['Coordinate of Red average pixel is ', num2str(round(xRedMean)), ' ' ,num2str(round(yRedMean)) ];
disp(report);
disp(' ');
report = ['Euclidean Distance between Orange and Yellow is ', num2str(round(orange2YellowTip))];
disp(report);
report = ['Euclidean Distance between Yellow and Blue is ', num2str(round(yellow2BlueTip))];
disp(report);
report = ['Euclidean Distance between Blue and Green is ', num2str(round(blue2GreenTip))];
disp(report);
report = ['Euclidean Distance between Green and Red is ', num2str(round(green2RedTip))];
disp(report);

function [yMean, xMean] = findCentralCoordinate(binaryImage)
    [yCoordinates,xCoordinates] = find(binaryImage); %Returns coordinates of nonzero elements
    xMean = mean(xCoordinates);
    yMean = mean(yCoordinates);
end
