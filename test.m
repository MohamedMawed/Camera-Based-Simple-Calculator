function image = test(b , w)

image = zeros(w);
for i=1:length(b)
    image(round(b(i,1)),round(b(i,2)))=255;
end
imshow(image);
end