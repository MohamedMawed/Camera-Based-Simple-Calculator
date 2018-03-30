function label = PredictOfMine(f,l,tf)

 distance = 1000000000000.0;
 label = 'intial';
 [Rows , Cols] = size(f);
 for i=1:Rows
     dis=0.0;
     for j=1:Cols
         tmp = sqrt((f(i,j)-tf(j))^2);
         dis = dis + double(tmp);
     end
     if(dis<distance)
         distance = dis;
         label = l(i);
     end

 end


end