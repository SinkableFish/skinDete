sample1=imread('.\trian\1.jpg');
sample2=imread('.\trian\3.jpg');
sample3=imread('.\trian\4.jpg');
sample4=imread('.\trian\5.jpg');
sample5=imread('.\trian\6.jpg');
sample6=imread('.\trian\7.jpg');
sample7=imread('.\trian\8.jpg');
sample8=imread('.\trian\9.jpg');
sample9=imread('.\trian\10.jpg');

testSample=imread('.\test\timg.jpg');

threshold=zeros(1,9);
threshold(1,1)=OTSU(sample1);
threshold(1,2)=OTSU(sample2);
threshold(1,3)=OTSU(sample3);
threshold(1,4)=OTSU(sample4);
threshold(1,5)=OTSU(sample5);
threshold(1,6)=OTSU(sample6);
threshold(1,7)=OTSU(sample7);
threshold(1,8)=OTSU(sample8);
threshold(1,9)=OTSU(sample9);
maxThreshold=max(threshold);
minThreshold=min(threshold);

testImage( testSample, minThreshold, maxThreshold);

% imshow(threshold);
% [m,n]=bwlabel(threshold, 4);
% mesh(m);