%A2
hand = imread('flat.png');
greyScaleHand = rgb2gray(hand);

greyScaleHandCount = imhist(greyScaleHand);

%greyNorm = (greyScaleHandCount - min(greyScaleHandCount))/(max(greyScaleHandCount) - min(greyScaleHandCount));
%[maxVal, maxIndex] = max(greyScaleHandCount);
%[minVal, minIndex] = min(greyScaleHandCount);
%meanG = uint8(mean(greyScaleHand(:)));

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


