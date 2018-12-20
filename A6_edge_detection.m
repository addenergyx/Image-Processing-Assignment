clear all;
close all;
clc;

%A6
hand = imread('flat.png');

%RGB colourspace
red = hand(:, :, 1); 
green = hand(:, :, 2); 
blue = hand(:, :, 3); 

%mask
skinBinary = red > 35 & red < 120 & green > 20 & green < 90 & blue < 70; 

skinIsolated = hand; 
skinIsolated(repmat(~skinBinary,[1 1 3])) = 0; 

%HSV colourspace
hsvHand = rgb2hsv(hand);

%mask
thresholds = (hsvHand(:,:,1) >= 0.039 ) & (hsvHand(:,:,1) <= 0.080) & ...
    (hsvHand(:,:,2) >= 0.410 ) & (hsvHand(:,:,2) <= 0.631) & ...
    (hsvHand(:,:,3) <= 0.497);
hsvSkinBinary = thresholds;

hsvSkinIsolated = hand;
hsvSkinIsolated(repmat(~hsvSkinBinary,[1 1 3])) = 0;

% ycbcr colourspace
I = rgb2ycbcr(hand);

yMin = 29.000;
yMax = 87.000;

cbMin = 116.000;
cbMax = 123.000;

crMin = 136.000;
crMax = 142.000;

ycbcrThresholds = (I(:,:,1) >= yMin ) & (I(:,:,1) <= yMax) & ...
    (I(:,:,2) >= cbMin ) & (I(:,:,2) <= cbMax) & ...
    (I(:,:,3) >= crMin ) & (I(:,:,3) <= crMax);
ycbcrSkinBinary = ycbcrThresholds;

maskedImage = hand;
maskedImage(repmat(~ycbcrSkinBinary,[1 1 3])) = 0;

handEdge = edge(skinBinary, 'canny');
handPrewittEdge = edge(skinBinary, 'prewitt');
handSobelEdge = edge(skinBinary, 'sobel');
handRobertEdge = edge(skinBinary, 'roberts');

hsvHandEdge = edge(hsvSkinBinary, 'canny');
hsvHandPrewittEdge = edge(hsvSkinBinary, 'prewitt');
hsvHandSobelEdge = edge(hsvSkinBinary, 'sobel');
hsvHandRobertEdge = edge(hsvSkinBinary, 'roberts');

ycbcrHandEdge = edge(ycbcrSkinBinary, 'canny');
ycbcrHandPrewittEdge = edge(ycbcrSkinBinary, 'prewitt');
ycbcrHandSobelEdge = edge(ycbcrSkinBinary, 'sobel');
ycbcrHandRobertEdge = edge(ycbcrSkinBinary, 'roberts');

figure('NumberTitle', 'off', 'Name', 'Edge Detection using RGB Image');
subplot(2,2,1);
imshow(hsvHandPrewittEdge);colormap gray;axis image;title('Prewitt'); 
subplot(2,2,2);
imshow(hsvHandRobertEdge);colormap gray;axis image;title('Roberts'); 
subplot(2,2,3);
imshow(hsvHandSobelEdge);colormap gray;axis image;title('Sobel'); 
subplot(2,2,4);
imshow(hsvHandEdge);colormap gray;axis image;title('Canny'); 

figure('NumberTitle', 'off', 'Name', 'Edge Detection using HSV Image');
subplot(2,2,1);
imshow(handPrewittEdge);colormap gray;axis image;title('Prewitt'); 
subplot(2,2,2);
imshow(handRobertEdge);colormap gray;axis image;title('Roberts'); 
subplot(2,2,3);
imshow(handSobelEdge);colormap gray;axis image;title('Sobel'); 
subplot(2,2,4);
imshow(handEdge);colormap gray;axis image;title('Canny'); 

figure('NumberTitle', 'off', 'Name', 'Edge Detection using YCbCr Image');
subplot(2,2,1);
imshow(ycbcrHandPrewittEdge);colormap gray;axis image;title('Prewitt'); 
subplot(2,2,2);
imshow(ycbcrHandRobertEdge);colormap gray;axis image;title('Roberts'); 
subplot(2,2,3);
imshow(ycbcrHandSobelEdge);colormap gray;axis image;title('Sobel'); 
subplot(2,2,4);
imshow(ycbcrHandEdge);colormap gray;axis image;title('Canny'); 

line = strel('line',11,90); %red outine

prewittEdge = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(ycbcrHandPrewittEdge)),line);
robertsEdge = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(ycbcrHandRobertEdge)),line);
sobelEdge = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(ycbcrHandSobelEdge)),line);
cannyEdge = imdilate((reshape(uint8([255 0 0]),[1,1,3]) .* uint8(ycbcrHandEdge)),line);

figure;
subplot(2,2,1);
imshow(hand+prewittEdge);colormap gray;axis image;title('Prewitt'); 
subplot(2,2,2);
imshow(hand+robertsEdge);colormap gray;axis image;title('Roberts'); 
subplot(2,2,3);
imshow(hand+sobelEdge);colormap gray;axis image;title('Sobel'); 
subplot(2,2,4);
imshow(hand+cannyEdge);colormap gray;axis image;title('Canny'); 






