% 
% %% setup
% %vl_setup;
% %imagePath = '/mnt/Images/Holidays/100000.jpg';
% imagePath = '/mnt/Images/1/';
% siftNumToExtract = 10;
% numFilesForSift = 1000;
% numFilesToAdd = 1000;
% % codebookSize = 64;
% 
% % add some file for replacing irrelevant ones
% numFilesForSift = numFilesForSift + 200;
% 
% sifts = [];
% 
% %% choosing file for sift extracting
% 
% % get folder content
% files = dir(imagePath);
% 
% % remove 2 navigation folders => '.', '..'
% files = files(3:end);
% fileAmount = numel(files);
% 
% fileNameList = cell(fileAmount, 1);
% 
% for i = 1:fileAmount
%     fileNameList{i} = [imagePath files(i).name];
% end
% 
% fileIdxes = randi(fileAmount, numFilesForSift, 1);
% 
% fileNameList = fileNameList(fileIdxes);
% 
% %% image processing
% validFileCounter = 0;
% processedFileCounter = 0;
% 
% tic
% while(validFileCounter < numFilesToAdd)
%   validFileCounter
%   processedFileCounter = processedFileCounter + 1;
%   
%   try
%       imageMatrixRGB = imread(fileNameList{processedFileCounter});
%       imageMatrixGS = single(rgb2gray(imageMatrixRGB));
%       [~, currentSift] = vl_sift(imageMatrixGS);
%       extractedSift = vl_colsubset(currentSift, siftNumToExtract);
%       sifts = [sifts extractedSift]; 
%       validFileCounter = validFileCounter + 1;
%   catch
%       continue;
%   end
% end 
% toc
% % imageMatrixRGB = imread(imagePath);
% % 
% % imageMatrixGS = rgb2gray(imageMatrixRGB);
% % 
% % %imshow(imageMatrixGS);
% % 
% % imageMatrixGSsingle = single(imageMatrixGS);
% % 
% % [currentSift] = vl_sift(imageMatrixGSsingle);
% % 
% % extractedSift = vl_colsubset(currentSift, siftNumToExtract);
% % 
% % sifts = [sifts extractedSift];
% 
% 
% % codebook learning
% 
% codebookSize = 64;
% 
% sifts = single(sifts);
% 
% [codebook, codebookAssignments] = vl_kmeans(sifts, codebookSize);
% 
% %% soft assignment sifts to clusters found
% softAssignments = zeros(codebookSize, size(sifts, 2));
% 
% for i = 1:numel(codebookAssignments)
%     softAssignments(codebookAssignments(i), i) = 1;
% end
% 
% 
% %% vlad encoding
% %sd = vl_alldist2(sifts, codebook)';
% 
% %vladEncoding = vl_vlad(sifts, codebook, softAssignments);
% 
% %calculate vald for each file
% 
% holidayPath = '/mnt/Images/Holidays/';
% holidayFiles = dir(holidayPath);
%  
% % remove all folders
%  holidayFiles = holidayFiles(find([holidayFiles.isdir] == 0));
%  holidayFileAmount = numel(holidayFiles);
%  
%  holidayfileNameList = cell(holidayFileAmount, 1);
%  holidayVlads = cell(holidayFileAmount, 2); %% 1 - file name, 2 - vlad
%  
%  tic;
%  for i = 1:holidayFileAmount
%      holidayVlads{i,1} = [holidayPath holidayFiles(i).name];
%      imageMatrixRGB = imread(holidayVlads{i,1});
%      imageMatrixGS = single(rgb2gray(imageMatrixRGB));
%      [~, currentSift] = vl_sift(imageMatrixGS);
%      ass = vl_alldist2(single(currentSift), codebook)';
%      currentVlad = vl_vlad(single(currentSift), codebook, ass);
%      holidayVlads{i,2} = currentVlad;
%  end
%  toc;
%  


%vlads = [holidayVlads{:,2}];
resAmount = 7;
queryFileNum = 20;

searchFileVlad = holidayVlads{queryFileNum, 2};

results = vl_alldist2(vlads, searchFileVlad);

[~, idxs] = sort(results);

resultIdxes = idxs(1:resAmount);

topResults = holidayVlads(resultIdxes, 1);

disp(['query file name = ' holidayVlads{queryFileNum, 1}]);

for i = 1:resAmount
    %imshow(top5results{i});
    
    [x, map] = imread(topResults{i});

    subplot(1, resAmount, i);
    
    subimage(x);
    title([num2str(resultIdxes(i)) ' -> ' topResults{i}(end-9:end)]);
    axis off;
end




