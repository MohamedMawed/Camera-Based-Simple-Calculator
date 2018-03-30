function [Dist,x1,x2,y1,y2] = DistanceFromCentroid(img)

Dist = 0;
img = ~img;
b = bwboundaries(img , 'holes');

[W,~] = size(b{2});
B = b{2};
for i=1:W
    for j=(i+1):W
        d = sqrt((B(i,1)-B(j,1))^2+(B(i,2)-B(j,2))^2);
        if (d>Dist)
            Dist = d;
            x1=B(i,1);
            x2=B(j,1);
            y1=B(i,2);
            y2=B(j,2);
        end
    end
end
end