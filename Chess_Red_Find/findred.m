% Author : Aravind Ravi
% Year   : 2015
% Description : This code identifies the red square in a given image of a chess board
% and outputs are the coordinates of the red box in the chess board.
% Sample images are: 
% chess1.png, chess2.png, chess3.png, chess4.png, 
% chess5.png - has multiple red squares

clc
clear all
close all

imageInput=imread('chess1.png');  %Reading the input image
grayImage=rgb2gray(imageInput);   %Converting rgb to grayscale image, ease of one matrix compared to 3 matrices of rgb

%% Processing
[rows,cols]=size(grayImage);

middleRow=round((rows/8)/2);            %Dividing image into blocks of 8 by 8 since we are expecting an image of a chessboard and chessboard has 8X8 squares, and locating the centre pixel of every square
middleCol=round((cols/8)/2);

jumpRow=floor(rows/middleRow);               %Identifying the indices multiplier factor for row and column    
jumpCol=floor(cols/middleCol);

for i=0:7
    for j=0:7
        reducedImage(i+1,j+1)=grayImage((2*i*jumpRow)+1,(2*j*jumpCol)+1);         %middle element will correspond to a jump of every (2n+1)
    end
end

for k=1:8
    for l=1:8
       if(reducedImage(k,l)>30 && reducedImage(k,l)<200)  %a very rough estimate of the threshold value for gray equivalent of the red color
            disp('The co-ordinates of Red is:');
            disp(k);
            disp(l);
       end
    end
end
%% Displaying the images
figure;imshow(imageInput);
title('Input Image');
%figure;imshow(grayImage);
