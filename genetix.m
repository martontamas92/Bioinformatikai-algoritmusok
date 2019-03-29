irisdata;
depth = 12;
dims = 12;
n = 40;
Pop = rand(n,dims*depth)>0.5;
Pop2 = zeros(n,dims*depth);
Fi = zeros(1,40);
selection = zeros(1,n);
X = [];
bestFitt = 0;
for i=1:n
    Fi(i)=fitt(Pop(i,:));
end   
for ciklus=1:300
    z = sum(Fi);
    for s=1:n
        th = z * rand(1);
        osszeg = Fi(1);
        i=1;
        while osszeg<th
            i=i+1;
            osszeg = osszeg + Fi(i);
        end
        selection(s)=i;
    end
    
    for r=1:2:n
        if rand(1)<0.9
            index = 1+randi(depth*dims-2,1,1);
            Pop2(r,:) = [Pop(selection(r),1:index-1) Pop(selection(r+1),index:(depth*dims))];
            Pop2(r+1,:) = [Pop(selection(r+1),1:index-1) Pop(selection(r),index:(depth*dims))];
        else
            Pop2(r,:) = Pop(selection(r),:);
            Pop2(r+1,:) = Pop(selection(r+1),:);
        end
    end

    for i=1:n
        for j=1:depth*dims
            if rand(1)<0.01
                Pop2(i,j)=1-Pop2(i,j);
            end
        end
    end
    Pop=Pop2;
    for i=1:n
        Fi(i)=fitt(Pop(i,:));
        if bestFitt<Fi(i)
            bestFitt=Fi(i);
            bajnok = Pop(i,:);
        end
    end       
    X = [X max(Fi)];
end
bajnok
bestFitt
eval(bajnok)
plot(X)