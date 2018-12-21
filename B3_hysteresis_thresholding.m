clear all;
close all;
clc;

%B3
hand = uigetfile();
hand = imread(hand);


red = hand(:, :, 1); 
green = hand(:, :, 2); 
blue = hand(:, :, 3); 

%Thresholds for orange tip
redt1 = 110;
redt2 = 146;
greent1 = 59;
greent2 = 90;
bluet1 = 46;
bluet2 = 14;

redbw = hysteresisthresholding(red, redt1, redt2);
greenbw = hysteresisthresholding(green, greent1, greent2);
bluebw = hysteresisthresholding(blue, bluet1, bluet2);

function newColourChannel = hysteresisthresholding(colourChannel, T1, T2)

    %Following guide from Image Histograms and Thresholding.pdf
    for row = 1:size(colourChannel,1)
        for col = 1:size(colourChannel,2)
            if colourChannel(row,col,1) < T1
                colourChannel(row,col,1) = 0;
            elseif colourChannel(row,col,1) > T2 
                colourChannel(row,col,1) = 1;
            else
                colourChannel(row,col,1) = 2;
            end
        end
    end

    %preallocating matrix increases speed
    newColourChannel = zeros(size(colourChannel,1),size(colourChannel,2));

    for row = 1:size(colourChannel,1)
        for col = 1:size(colourChannel,2)
            if colourChannel(row,col,1) == 2
                if row == 1 && col == 1
                    if colourChannel(row+1,col+1,1)==1 || colourChannel(row+1,col,1)==1 || colourChannel(row,col+1,1)==1
                        newColourChannel(row,col,1) = 1;
                    end
                elseif row == 1
                    if colourChannel(row+1,col+1,1)==1 || colourChannel(row+1,col,1)==1 || colourChannel(row,col+1,1)==1 || colourChannel(row,col-1,1)==1 || colourChannel(row+1,col-1,1)==1
                        newColourChannel(row,col,1) = 1;
                    end
                elseif col == 1
                    if colourChannel(row+1,col+1,1)==1 || colourChannel(row+1,col,1)==1 || colourChannel(row,col+1,1)==1 || colourChannel(row-1,col,1)==1 || colourChannel(row-1,col+1,1)==1 
                        newColourChannel(row,col,1) = 1;
                    end
                elseif row == size(colourChannel, 1) && col == size(colourChannel, 2)
                    if red(colourChannel-1,col-1,1)==1 || colourChannel(row-1,col,1)==1 || colourChannel(row,col-1,1)==1
                        newColourChannel(row,col,1) = 1;
                    end
                elseif row == size(colourChannel, 1)
                    if colourChannel(row,col+1,1)==1 || colourChannel(row-1,col-1,1)==1 || colourChannel(row-1,col,1)==1 || colourChannel(row,col-1,1)==1  || colourChannel(row-1,col+1,1)==1 
                        newColourChannel(row,col,1) = 1;
                    end
                elseif col == size(colourChannel, 2)
                    if colourChannel(row+1,col,1)==1 || colourChannel(row-1,col-1,1)==1 || colourChannel(row-1,col,1)==1 || colourChannel(row,col-1,1)==1 || colourChannel(row+1,col-1,1)==1
                        newColourChannel(row,col,1) = 1;
                    end
                elseif colourChannel(row+1,col+1,1)==1 || colourChannel(row+1,col,1)==1 || colourChannel(row,col+1,1)==1 || colourChannel(row-1,col-1,1)==1 || colourChannel(row-1,col,1)==1 ...
                    || colourChannel(row,col-1,1)==1  || colourChannel(row-1,col+1,1)==1 || colourChannel(row+1,col-1,1)==1
                        newColourChannel(row,col,1) = 1; %adjacent pixels
                end
            %else
                %newred(row,col,1) = red(row,col,1);
            end
        end
    end
    
    disp('done')   
end



