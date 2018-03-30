function [f,X] = FourierDescriptors2(img,Coms)
img = imgaussfilt(img,0.63);
[~,~,D]=size(img);
if(D>1)
img = rgb2gray(img);
end
img = imbinarize(img);
img = ~img;
try
img = centerobject(img);
catch
    f=[];
    X = 'null';
    return;
end
four = gfd(img,3,12);
for i=1:Coms
    f(i) = four(i);
end
X='till';

end