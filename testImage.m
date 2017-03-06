function [ output_args ] = testImage( testSample, minThreshold, maxThreshold )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
temp1=rgb2ycbcr(testSample);
test1=temp1(:,:,2);
[m,n]=size(test1);
for i=1:m
    for j=1:n
        if test1(i,j)>minThreshold %&& test1(i,j)<maxThreshold
            test1(i,j)=0;
        else
            test1(i,j)=255;
        end
    end
end

[data, k]=bwlabel(test1,4);
for i=1:k
    if length(find(data==i))>(m*n*0.5) ||length(find(data==i))<(m*n*0.02)
        data(data==i)=0;
    end
end
data(data~=0)=255;
figure(1);
imshow(data);
figure(2);
imshow(test1)


end

