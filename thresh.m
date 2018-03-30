function res = thresh(img,val)
[w,h] = size(img);
for i=1:w
    for j=1:h
        if(img(i,j)>=val)
            res(i,j)=1;
        else
            res(i,j)=0;
        end
    end
end
end