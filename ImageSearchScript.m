%% new image processing
% codebook calculation
% % % % searchImagePath = '/mnt/Images/Holidays/';
% % % % codebookImagePath = '/mnt/Images/1/';
% % % % codebookSize = 64;
% % % % 
% % % % tic;
% % % % [codebook, assignments] = makeCodebook(codebookImagePath, codebookSize);
% % % % toc;
% % % % 
% % % % 
% % % % searchFiles = getFilesOnly(searchImagePath);
% % % % searchFilesAmount = numel(searchFiles);
% % % % imageDataBase = cell(searchFilesAmount, 1);

%% vlad calculation
% % % % tic;
% % % % for i = 1:searchFilesAmount
% % % %     imageDataBase{i} = getFileValdStruct( [searchImagePath searchFiles(i).name], []);
% % % %     imageDataBase{i}.vlad = getVlad(imageDataBase{i}.fileName, codebook);
% % % % end
% % % % toc;



%% query performing
indexToSearch = 1471;

queryPath = imageDataBase{indexToSearch}.fileName;
resultsAmount = 15;

searchImage(queryPath, imageDataBase, codebook, resultsAmount);
