function NewImage = FindEquation(img)
[W,H,THR] = size(img);
B=img;
if(THR>1)
B = rgb2gray(B);
end
NewImage = imbinarize(B);
if(~iswhite(NewImage))
    NewImage = ~NewImage;
end

SE = [0 1 0; 1 1 1; 0 1 0];

NewImage = imdilate(NewImage,SE);

 for i=0:50
 NewImage = imerode(NewImage,SE);
 end
 
 NewImage=~NewImage;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 ValidOrNot=[];

 values=[];
count = [];
cc = bwconncomp(NewImage);


for i=1:cc.NumObjects
    n = cc.PixelIdxList{1,i};
    [N , ~] = size(n);
    dfsminx=100000000;
    dfsminy=100000000;
    dfsmaxx=0;
    dfsmaxy=0;
    BorderOrNot=0;
    for j=1:N
        idx = n(j);
        [row , col] = ind2sub([W,H],idx);
       if(row==1||col==1||row==W||col==H)
           BorderOrNot=1;
       end
       dfsminx=min(dfsminx,row);
       dfsminy=min(dfsminy,col);
       dfsmaxx=max(dfsmaxx,row);
       dfsmaxy=max(dfsmaxy,col);       
    end
    
        ValidOrNot = [ValidOrNot BorderOrNot];
        count = [count N];
    values = [values;dfsminx dfsminy dfsmaxx dfsmaxy];
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 [~ , N]=size(ValidOrNot);
 Maxcount=0;
minx=100000;
maxx=0;
miny=100000;
maxy=0;
CanHappen=1;
 for i=1:N
    if(~ValidOrNot(i))
        if(count(i)>Maxcount)
        minx=values(i,1);
        miny=values(i,2);
        maxx=values(i,3);
        maxy=values(i,4);
        Maxcount=count(i);
        CanHappen=0;
        end
        
    else if(CanHappen)
        minx=values(i,1);
        miny=values(i,2);
        maxx=values(i,3);
        maxy=values(i,4);
    end
 end

 
NewImage =imcrop(img,[miny+20 minx+30 maxy-miny-30 maxx-minx-50]);    
figure,imshow(NewImage);
end
