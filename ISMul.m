function bool = ISMul(img)

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
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
[w,h,~]=size(img);
  x1 = 1;
  x2 = w;
  y1 = 1;
  y2 = h;
  
  
  slope1 = (y1-y2)./(x2-x1);
  black1=0;
  count1=0;
  for i=1:w
      for j=1:h
          
          if(((y1-j)./(i-x1))>=(slope1-0.01)&&((y1-j)./(i-x1))<=(slope1+0.01))
          count1 = count1+1;
          if(img(i,j)==0)
              black1 = black1+1;
          end
          
          end
      end
  end
  if(black/count > 0.800000&&black1/count>0.80000000 && iswhite(img)==1)
      bool=1;
      return;
  end
  bool =0;
end