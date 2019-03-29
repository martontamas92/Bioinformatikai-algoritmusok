function [F] = fitt(E)
irisdata;
depth = 12;
dims = 12;
c = 3;
v = zeros(c,dims/c);
for i=1:c
    for j=1:dims/c
        start = (i-1)*48 + (j-1)*12 + 1;
        for k=start:start+depth-1
            v(i,j)=v(i,j)*2+E(k);
        end
        v(i,j)=v(i,j)/(2^depth-1);
    end
end
dist = zeros(1,c);
sum=40;
for k=1:size(iris,1)
    sumj = 0;
    for i=1:c
        dist(i) = norm(iris(k,:)-v(i,:));
        sumj = sumj + dist(i)^(-2);
    end
    for i=1:c
        sum = sum - dist(i)^(-2) / sumj^2;
    end
end
if sum<1
    sum = 1;
end
F = sum;
