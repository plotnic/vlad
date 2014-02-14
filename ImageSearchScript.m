%% codebook calculation
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
% % % % 
% % % % %% vlad calculation
% % % % tic;
% % % % for i = 1:searchFilesAmount
% % % %     imageDataBase{i} = getFileValdStruct( [searchImagePath searchFiles(i).name], []);
% % % %     imageDataBase{i}.vlad = getVlad(imageDataBase{i}.fileName, codebook);
% % % % end
% % % % toc;



%% query performing
indexToSearch = 47;
resultsAmount = 15;

queryPath = imageDataBase{indexToSearch}.fileName;
%queryPath = '/home/plotnikov/korall.jpg';


searchImage(queryPath, imageDataBase, codebook, resultsAmount);



%% function testing
% % % % % queryPath = '/home/plotnikov/korall.jpg';
% % % % % % % % % % % 
% % % % % % % % % % % v = getVlad(queryPath, codebook);
% % % % % 
% % % % %   sifts = getSiftsFromFile(queryPath);
% % % % %   
% % % % %   vlad = getVlad(queryPath, codebook);

