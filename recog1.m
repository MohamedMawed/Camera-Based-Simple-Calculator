function Label2 = recog1(img)

    [W,~,D]=size(img);
    if(D>1)
    img = rgb2gray(img);
    end
    img = thresh(img,100);
    [LongestLineInside,x1,x2,y1,y2] = DistanceFromCentroid(img);
    if(LongestLineInside/W > 0.5)
        Label2 = '0';
    else
        if(LongestLineInside/W > 0.333&&(x1<(W/4)||x2<(W/4)))
            Label2 ='9';
        else
           if(LongestLineInside/W > 0.333&&(x1>((2*W)/3)||x2>((2*W)/3)))
               Label2 ='6';
           else 
               Label2 ='4';
           end
        end
    end

end