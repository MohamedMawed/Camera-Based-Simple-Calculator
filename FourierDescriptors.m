function [Descriptors] = FourierDescriptors(img , Coms)
[~,~,D]=size(img);
if(D>1)
img = rgb2gray(img);
end
img = thresh(img,100);
img = ~img;
% imshow(img);
b = bwboundaries(img , 'holes');

fourierCoff = frdescp(b{1});
rev = fourierCoff;
ResultCoff =[];
for i=1:Coms
    ResultCoff(i) = fourierCoff(i);
end


% if length(b) == 2
%     fourierCoff1 = frdescp(b{1});
%     fourierCoff2 = frdescp(b{2});
%     ResultCoff =[];
%     for i=1:20
%     ResultCoff(i) = fourierCoff1(i);
%     end
%     for i=21:30
%     ResultCoff(i) = fourierCoff2(i);
%     end
%     
%     
% end
% 
% if length(b) == 3
%     fourierCoff1 = frdescp(b{1});
%     fourierCoff2 = frdescp(b{2});
%     fourierCoff3 = frdescp(b{3});
%     ResultCoff =[];
%     for i=1:20
%     ResultCoff(i) = fourierCoff1(i);
%     end
%     for i=21:25
%     ResultCoff(i) = fourierCoff2(i);
%     end
%     for i=26:30
%     ResultCoff(i) = fourierCoff3(i);
%     end
%     
% end

ResultCoff(1)=0;
val = abs(ResultCoff(2));
ResultCoff= abs(ResultCoff);
ResultCoff= ResultCoff./val;

Descriptors = ResultCoff;





    end