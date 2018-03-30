function bool = ISTrueFive(img)


img = imgaussfilt(img,0.63);
[w,h,D]=size(img);
if(D>1)
img = rgb2gray(img);
end
img = imbinarize(img);
white = 0;

for i=round(w/2):w
    for j=1:round(h/2)
        if img(i,j) == 1
            white = white + 1;
        end
    end
end
if white/(round(w/2)*round(h/2)) >= 0.50000
    bool = 1;
else
    bool = 0;
end
end