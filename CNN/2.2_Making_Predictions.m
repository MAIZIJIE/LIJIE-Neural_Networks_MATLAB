% Task 1
% Load pretrained network
deepnet = alexnet;

% Do not edit. This code imports and displays the image in file01.jpg.
img1 = imread('test.jpg');
imshow(img1);
% Task 2
% Classify an image
pred1 = classify(deepnet,img1)
% This code imports and displays the images in file02.jpg and file03.jpg.
img2 = imread('file01.jpg');
imshow(img2);
img3 = imread('file01.jpg');
imshow(img3);
% Task 3
% Classify further images
pred2 = classify(deepnet,img2)
pred3 = classify(deepnet,img3)
