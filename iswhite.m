function x = iswhite(img)
[w,h] = size(img);
white=0;
black=0;
for i=1:w
    for j=1:h
        if(img(i,j)==1)
            white=white+1;
        else
            black=black+1;
        end
    end
end
if(white>black)x=1;
else x=0;
end