function eval(E)
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
correct=0;
for k=1:size(iris,1)
    for i=1:c
        dist(i) = norm(iris(k,:)-v(i,:));
    end
    [Y,I] = min(dist,[],2);
    if k<=50
        if I==1
            correct = correct+1;
        end
    elseif k<=100
        if I==2
            correct = correct+1;
        end
    else
        if I==3
            correct = correct+1;
        end
    end
end
correct
