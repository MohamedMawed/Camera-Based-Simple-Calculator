function bool = ISNeg(img)
[w,h,~]=size(img);

black=0;

for i=1:w
    for j=1:h
        if(img(i,j)==0)
            black = black + 1;
        end
    end
end
if(black/(w*h)>(2/3)||w<(h/2))
        bool=1;
    return;
end
bool=0;
end