clc;
clear all;
% Investigate Predictions
% Instructions are in the task pane to the left. Complete and submit each task one at a time.
% 
% This code loads in an image and imports AlexNet.
img = imread('test.jpg');
imshow(img)
net = alexnet;
categorynames = net.Layers(end).ClassNames;

% Task 1
% Classify an image
[pred,scores] = classify(net,img);

% Task 2
% Display scores
bar(scores);  %��1000��

% Task 3
% Threshold scores
highscores = scores > 0.01; %��ȡ����0.01

% % thresh = median(scores) + std(scores)  %%�Զ����������
% % highscores = scores > thresh;

% Task 4
% Display thresholded scores

bar(scores(highscores));


% Task 5
% Add tick labels

% xticklabels(categorynames(highscores))
xticks(1:length(scores(highscores)))
xticklabels(categorynames(highscores))
xtickangle(60)

