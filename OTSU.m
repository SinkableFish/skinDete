function [ targetThreshold ] = OTSU( originalData )

tempData = rgb2ycbcr(originalData);
matrixCr = double(tempData(:,:,2));
[m,n] = size(matrixCr);
% imshow(matrixCr);
maxValue = 0;
targetThreshold = 0;
for tempThreshold=1:255
    frontCount=0;backCount=0;frontSum=0;backSum=0;
    for i=1:m
        for j=1:n
            if matrixCr(i,j)>tempThreshold
                frontSum = frontSum+matrixCr(i,j);
                frontCount = frontCount+1;
            else
                backSum = backSum+matrixCr(i,j);
                backCount = backCount+1;
            end
        end
    end
    p1 = frontCount/(m*n);
    p2 = backCount/(m*n);
    frontAverage = frontSum/frontCount;
    backAverage = backSum/backCount;
    variance = p1*p2*(frontAverage-backAverage)*(frontAverage+backAverage);
    if(variance > maxValue)
        targetThreshold = tempThreshold;
        maxValue = variance;
    end
end
matrixCr(matrixCr<124)=1;
matrixCr(matrixCr>=124)=0;
end

