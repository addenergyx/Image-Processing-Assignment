%A1
%file = uigetfile;
hand = imread('IMG_2670.JPG');
greyScaleHand = rgb2gray(hand);

figure;
subplot(1,2,1); 
imagesc(hand);colormap gray;axis image;title('Image A - rgb');
subplot(1,2,2); 
imagesc(greyScaleHand);colormap gray;axis image;title('Image B - grey scale');

%rgb2gray uses luminosity conversion
%0.2989 * R + 0.5870 * G + 0.1140 * B
%0.21R + 0.72G + 0.07B

%A2
%handCount = imhist(hand); - should be a matrix 256x3 not 256x1
greyScaleHandCount = imhist(greyScaleHand);
greyNorm = (greyScaleHandCount - min(greyScaleHandCount))/(max(greyScaleHandCount) - min(greyScaleHandCount));
[maxVal, maxIndex] = max(greyScaleHandCount);
[minVal, minIndex] = min(greyScaleHandCount);
meanG = uint8(mean(greyScaleHand(:)));

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