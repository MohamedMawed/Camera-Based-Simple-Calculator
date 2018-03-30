function bool = ISPlus(img)

[w,h,~]=size(img);

black=0;

i=round(w/2);
    for j=1:h
        if(img(i,j)==0)
            black = black + 1;
        end
    end
black1=0;
i=round(h/2);
for j=1:w
        if(img(j,i)==0)
            black1 = black1 + 1;
        end
end
    
if(black/(h)>(3/4)&&black1/(w)>(3/4))
    bool =1;
    return;
end
bool=0;

end