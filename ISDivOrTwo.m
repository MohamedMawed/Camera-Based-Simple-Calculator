function bool = ISDivOrTwo(img)

[w,h,~]=size(img);
  x1 = 1;
  x2 = w;
  y1 = h;
  y2 = 1;
  
  slope = (y1-y2)./(x2-x1);
  black=0;
  count=0;
  for i=1:w
      for j=1:h
          if(((y1-j)./(i-x1))>=(slope-0.01)&&((y1-j)./(i-x1))<=(slope+0.01))
          count = count+1;
          if(img(i,j)==0)
              black = black+1;
          end
          
          end
      end
  end
  
  if((black/count)>(0.60000)&& iswhite(img)==1 && iswhite(img((round(3*w/4):w),:))==1)
    
          bool = 1;
          if w > 2*h
          return;
          end
  end
  bool =0;
end