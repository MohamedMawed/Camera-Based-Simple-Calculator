function Equation = fixbrackets(string)
[x,y]=size(string);
Equation = zeros(1,y);
Taked = zeros(1,y);
i=1;
k=y;
while(i<=y&&Taked(i)==0)
    if(string(i) == ')')
        string(i) = '(';
    end
    if(string(i) == '(')
        j=k;
        while(j>=1)
            if((string(j) == ')'||string(j) == '(')&&Taked(j)==0)
               string(j) = ')';
               Taked(j)=1;
               k=j-1;
               break;
            end
            j = j-1;
        end
            
    end
    i=i+1;
end
Equation = string;
end
    
