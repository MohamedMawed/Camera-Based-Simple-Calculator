function Labels = recog2(img)

    [~,~,D]=size(img);
    if(D>1)
    img = rgb2gray(img);
    end
    img = thresh(img,100);
    if ISNeg(img)==1
             Labels = '-';
    else
        if ISPlus(img)==1
       Labels = '+';
   else
       if ISMul(img)==1
           Labels ='x';
       else
               if ISDivOrTwo(img)==1
               Labels ='/';
            
               else 
               Labels = 'h';
               end
       end
        end
    end

end