clear all;
close all;
clc;

%A5
[yOrange,xOrange] = find(orangeTipBinary);
xOrangeMean = mean(xOrange);
yOrangeMean = mean(yOrange);

[yblue,xblue] = find(blueTipBinary);
xBlueMean = mean(xblue);
yBlueMean = mean(yblue);

[ygreen,xgreen] = find(greenTipBinary);
xGreenMean = mean(xgreen);
yGreenMean = mean(ygreen);

[yYellow,xYellow] = find(yellowTipBinary);
xYellowMean = mean(xYellow);
yYellowMean = mean(yYellow);

[yRed,xRed] = find(redTipBinary);
xRedMean = mean(xRed);
yRedMean = mean(yRed);

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


orange2YellowTip = pdist([xOrangeMean,yOrangeMean;xYellowMean,yYellowMean],'euclidean');
yellow2BlueTip = pdist([xYellowMean,yYellowMean;xBlueMean,yBlueMean],'euclidean');
blue2GreenTip = pdist([xBlueMean,yBlueMean;xGreenMean,yGreenMean],'euclidean');
green2RedTip = pdist([xGreenMean,yGreenMean;xRedMean,yRedMean],'euclidean');
