%A2
greyScaleHandCount = imhist(greyScaleHand);
greyNorm = (greyScaleHandCount - min(greyScaleHandCount))/(max(greyScaleHandCount) - min(greyScaleHandCount));
[maxVal, maxIndex] = max(greyScaleHandCount);
[minVal, minIndex] = min(greyScaleHandCount);
meanG = uint8(mean(greyScaleHand(:)));

%rgb hist count
%handCount = imhist(hand); - should be a matrix 256x3 not 256x1
handRed = hand(:,:,1);
handGreen = hand(:,:,2);
handBlue = hand(:,:,3);

handRedCount = imhist(handRed);
handGreenCount = imhist(handGreen);
handBlueCount = imhist(handBlue);

%figure;
%line(0:255, greyScaleHandCount);
%xlabel('Luminance', 'FontSize', 14);
%ylabel('Count','FontSize',14);
%xlim([0 255]);
%ylim([0 max(greyScaleHandCount)]);

figure;
line(0:255, greyNorm);
xlabel('Luminance', 'FontSize', 14);
ylabel('Normalised Count','FontSize',14);
xlim([0 255]);
ylim([0 max(greyNorm)]);

