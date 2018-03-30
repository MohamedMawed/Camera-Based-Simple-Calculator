function val = FindCharacters(img,h)
waitbar(300/1000,h,'recongition begins');
[W,H,THR] = size(img);
B=img;
if(THR>1)
B = rgb2gray(B);
end
B = imgaussfilt(B,0.63);
NewImage = imbinarize(B);

%figure,imshow(NewImage);
if(~iswhite(NewImage))
    NewImage = ~NewImage;
end
NewImage=~NewImage;
cc = bwconncomp(NewImage);

rmdir Testing s
mkdir Testing
cd Testing
for i=1:cc.NumObjects
    n = cc.PixelIdxList{1,i};
    [N , ~] = size(n);
    dfsminx=100000000;
    dfsminy=100000000;
    dfsmaxx=0;
    dfsmaxy=0;
    for j=1:N
        idx = n(j);
        [row , col] = ind2sub([W,H],idx);
      
       dfsminx=min(dfsminx,row);
       dfsminy=min(dfsminy,col);
       dfsmaxx=max(dfsmaxx,row);
       dfsmaxy=max(dfsmaxy,col);       
    end
    
    tmp = imcrop(NewImage,[dfsminy-1 dfsminx-1 dfsmaxy-dfsminy+2 dfsmaxx-dfsminx+2]);
    [Wtmp,Htmp] = size(tmp);
    
    tmp = imresize(tmp , [Wtmp*3 Htmp*3]);
    
    tmp=~tmp;
    name =int2str(i);
  
    name = strcat(name , '.jpg');
    imwrite(tmp,name);
end
waitbar(350/1000,h,'recognition still working');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get labels for each image.
syntheticDir = 'C:\Users\Mohamed\Desktop\Mawed Image Processing\Project\SourceCode\Testing';
TestingData = imageDatastore(syntheticDir,   'IncludeSubfolders', true, 'LabelSource', 'foldernames');
cd 'C:\Users\Mohamed\Desktop\Mawed Image Processing\Project\SourceCode\'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numImages = numel(TestingData.Files);
TestingFeatrues=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FinalLabel = [];
% rmdir Testing1 s
% mkdir Testing1
% rmdir Testing2 s
% mkdir Testing2

for i = 1:numImages
   img = readimage(TestingData, i);
   [fd,X] = FourierDescriptors2(img,20);
   if X=='till'
   TestingFeatrues = [TestingFeatrues;fd];
   else
       TestingFeatrues = [TestingFeatrues;zeros(1,20)];
       FinalLabel(i)=' ';
       continue;
   end
   %[TestingFeatrues;FourierDescriptors(img,35)];
        ComNumber = CommNumber(img);
        if(ComNumber == 3)
            FinalLabel(i)='8'; 
        end
        if(ComNumber == 1)
          Label = recog2(img);
           FinalLabel(i)=Label;
        end
        if(ComNumber == 2)
          Label = recog1(img);
          FinalLabel(i)=Label;
        end
    end
cd  'C:\Users\Mohamed\Desktop\Mawed Image Processing\Project\SourceCode'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syntheticDir = 'C:\Users\Mohamed\Desktop\Mawed Image Processing\Project\SourceCode\traingData';
trainingSet = imageDatastore(syntheticDir,   'IncludeSubfolders', true, 'LabelSource', 'foldernames');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numImages = numel(trainingSet.Files);
trainingFeatures=[];
for i = 1:numImages
    img = readimage(trainingSet, i);
    trainingFeatures = [trainingFeatures;FourierDescriptors2(img,20)];
    %[trainingFeatures;FourierDescriptors(img,35)];
end

TraingLabels = trainingSet.Labels;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PredictedLabels = [];
numImages = numel(TestingData.Files);
for i=1:numImages
    if FinalLabel(i) == 'h'
    PredictedLabel = PredictOfMine(trainingFeatures,TraingLabels,TestingFeatrues(i,:));
    PredictedLabels=[PredictedLabels;PredictedLabel];
    FinalLabel(i) = char(PredictedLabel);
    if FinalLabel(i) == '5'
        bool = ISTrueFive(readimage(TestingData,i));
        if bool == 0
            FinalLabel(i) = '2';
        end
    end   
    end
    if FinalLabel(i)=='A' || FinalLabel(i)=='x'
        FinalLabel(i)='*';
    else
        if FinalLabel(i)=='D';
            FinalLabel(i)='.';
        end
    end
   
end
waitbar(400/1000,h,'collecting results');
PredictedLabels
char(FinalLabel)
OutPut = resort(char(FinalLabel))
char(OutPut)
OutPut = char(fixbrackets(char(OutPut)))
try
val =subs(char(OutPut))
catch
    val = 'null';
end
end