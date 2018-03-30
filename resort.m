function Equation = resort(string)
[x,y]=size(string);
Equation = zeros(1,y);
i = 1;
j=1;
while(i<=y)
    Equation(j) = string(i);
    j=j+1;
    if(i+10>y)
        i = i+1;
        continue;
    end
    if i+18<=y
    i=i+11;
    else
        i = i + mod(y,10)+2;
    end
end
c=1;

while(c+10<=y)
    x = c+mod(y,10)+1;
   for k=(c+1):min(c+10,x)
       Equation(j)=string(k);
       j = j+1;
   end
  
    c=c+11;
end

end