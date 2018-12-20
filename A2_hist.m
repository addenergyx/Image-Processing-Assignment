clear all;
close all;
clc;

%A2
hand = uigetfile();
hand = imread(hand);
greyScaleHand = rgb2gray(hand);

greyScaleHandCount = imhist(greyScaleHand);

handRed = hand(:,:,1);
handGreen = hand(:,:,2);
handBlue = hand(:,:,3);

handRedCount = imhist(handRed);
handGreenCount = imhist(handGreen);
handBlueCount = imhist(handBlue);

greyScaleMean = mean2(greyScaleHand);
redMean = mean2(handRed);
greenMean = mean2(handGreen);
blueMean = mean2(handBlue);

figure;

subplot(1,2,1);
plot(0:255, handRedCount, 'r','LineWidth', 1);hold on
plot(0:255, handGreenCount, 'g','LineWidth', 1);hold on
plot(0:255, handBlueCount, 'b','LineWidth', 1);
xlabel('Intensity', 'FontSize', 14); ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
rgbHistYLength = get(gca,'YLim');
ylim([0 max(handRedCount)]);
line([redMean,redMean],rgbHistYLength,'Color','r','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(handGreenCount)]);
line([greenMean,greenMean],rgbHistYLength,'Color','g','LineWidth', 1,'LineStyle', '--');hold on
ylim([0 max(handBlueCount)]);
line([blueMean,blueMean],rgbHistYLength,'Color','b','LineWidth', 1,'LineStyle', '--');

subplot(1,2,2);
plot(0:255, greyScaleHandCount, 'black','LineWidth', 1);
xlabel('Luminance', 'FontSize', 14);ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
ylim([0 max(greyScaleHandCount)]);
greyScaleHistYLength = get(gca,'YLim');
line([greyScaleMean,greyScaleMean],greyScaleHistYLength,'Color','black','LineWidth', 1,'LineStyle','--');

report = ['Max, Min and Arithmetic  Mean of the red channel is  ', num2str(max(handRed(:))), ', ' ,num2str(min(handRed(:))), ', ',num2str(round(redMean)), ' respectively'];
disp(report);
report = ['Max, Min and Arithmetic  Mean of the green channel is  ', num2str(max(handGreen(:))), ', ' ,num2str(min(handGreen(:))), ', ',num2str(round(greenMean)), ' respectively'];
disp(report);
report = ['Max, Min and Arithmetic  Mean of the blue channel is  ', num2str(max(handBlue(:))), ', ' ,num2str(min(handBlue(:))), ', ',num2str(round(blueMean)), ' respectively'];
disp(report);
report = ['Max, Min and Arithmetic  Mean of the greyscale image is  ', num2str(max(greyScaleHand(:))), ', ' ,num2str(min(greyScaleHand(:))), ', ',num2str(round(greyScaleMean)), ' respectively'];
disp(report);



