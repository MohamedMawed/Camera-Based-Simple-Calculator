function N = CommNumber(img)

[~,~,D]=size(img);
if(D>1)
img = rgb2gray(img);
end
img = thresh(img,100);
img = ~img;
SE = [0 1 0;1 1 1;0 1 0];
tmp = imerode(img,SE);
img = img - tmp;
cc = bwconncomp(img);
N=cc.NumObjects;

end