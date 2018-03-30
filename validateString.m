function goodequation = validateString(equation)
x = equation(1,1);
x = char(x);
[N]  = size(x);
for i=1:N
    if x(i) == 'g'
        x(i-1)='o';
    end
    if(x(i) == 'n')
        x(i-1)='a';
    end
    if(x(i) == 'o' && (x(i+1)~='g'||x(i+1)~='s'))
        x(i)='0';
    end
            
end
goodequation=x;
end
