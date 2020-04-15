
%This code imports AlexNet.
deepnet = alexnet;

%Task 1
%Save layers
ly = deepnet.Layers

%Task 2
%Extract first layer
inlayer = ly(1);

%Task 3
%Extract input size
insz = inlayer.InputSize;

%Task 4
%Extract last layer

outlayer =ly(25);


%Task 5
%Extract class names
categorynames = outlayer.Classes;