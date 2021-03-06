
% ------------------------standard number array-----------------------

one=[-1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1;...
     -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 -1 -1];
 
two=[-1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 -1 -1 -1 -1 -1 -1 1 1 -1;-1 -1 -1 -1 -1 -1 -1 1 1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
     -1 1 1 -1 -1 -1 -1 -1 -1 -1;-1 1 1 -1 -1 -1 -1 -1 -1 -1;...
     -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1];
  
%   ----------------------plot standard number figure----------------- 

 ONE=imresize(one,20);
 subplot(3,2,1)
 imshow(ONE)
 title('stand number')
 
 TWO=imresize(two,20);
 subplot(3,2,2)
 imshow(TWO)
 title('stand number')
 
%  ----------------------create hopfield net--------------------------

 T=[one;two]';
 net=newhop(T);
 
%  ------------------------------generate noise----------------------------
       % -------------------------noise array(fixed noise)--------------

%            no1=[-1 -1 -1 -1 1 1 -1 -1 -1 -1;-1 -1 -1 -1 1 -1 -1 -1 -1 -1;...
%                 -1 -1 1 -1 1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 1 -1 -1 -1;...
%                 -1 -1 -1 -1 -1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 1 -1 -1;...
%                 -1 -1 -1 -1 1 1 -1 -1 -1 -1; -1 1 -1 -1 1 1 -1 -1 -1 -1;...
%                 -1 -1 -1 -1 -1 1 -1 -1 -1 -1; -1 -1 -1 -1 1 1 -1 -1 1 -1];
%             
%            no2=[-1 1 1 1 -1 1 1 -1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
%                 -1 -1 1 -1 1 -1 -1 1 1 -1;-1 -1 -1 1 -1 1 -1 1 1 -1;...
%                 -1 1 1 1 1 1 1 1 1 -1;-1 1 1 1 1 1 1 1 1 -1;...
%                 -1 1 1 -1 -1 -1 -1 -1 -1 -1;-1 1 1 -1 -1 -1 -1 -1 -1 -1;...
%                 -1 1 1 1 -1 1 1 1 1 -1;-1 1 1 -1 1 1 1 1 1 -1];

      % -----------------------noise array(rand noise)-----------------

            rand('state',0);
            for i=1:100
                a=rand;
                if a<0.05
                   one(i)=-one(i);
                   two(i)=-two(i);
                end
            end
            no1=one;
            no2=two;
 
%  -------------------------plot noisy figure---------------

 subplot(3,2,3)
 NO1=imresize(no1,20);
 imshow(NO1)
 title('noisy number')
 
 subplot(3,2,4)
 NO2=imresize(no2,20);
 imshow(NO2)
 title('noisy number')
 
% --------------------------plot identify figure--------------
 
noise1={(no1)'};
tu1=sim(net,{10,10},{},noise1);
tu1{10}'
subplot(3,2,5)
imshow(imresize(tu1{10}',20))
title('identify number')

noise2={(no2)'};
tu2=sim(net,{10,10},{},noise2);
tu2{10}'
subplot(3,2,6)
imshow(imresize(tu2{10}',20))
title('identify number')


