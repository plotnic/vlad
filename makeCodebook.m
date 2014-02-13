function [ codebook, assignments ] = makeCodebook(dirName, codebookSize)
%makes a codebook from files which are in dirName using K-means
% siftNumToExtract = 10;
  NUM_FILES_FOR_SIFT = 1000;
  SIFTS_FROM_FILE = 10;

  % get folder content
  files = getFilesOnly(dirName);
  
  fileAmount = numel(files);
  
  if NUM_FILES_FOR_SIFT > fileAmount 
     error(['In "' dirName '" has to be at least ' num2str(NUM_FILES_FOR_SIFT) ' files' ]); 
  end
  
  fileCounter = 0;
  fileIterator = 0;
  
  sifts = [];
  fileIdxes = randperm(fileAmount);
  
  % sift collecting  
  while fileCounter < NUM_FILES_FOR_SIFT
    fileIterator = fileIterator + 1;
    
    try
      currentSift = getSiftsFromFile([dirName files(fileIdxes(fileIterator)).name], SIFTS_FROM_FILE);
      sifts = [sifts currentSift];
      fileCounter = fileCounter + 1;
    catch
      continue;  
    end
  end
 
  sifts = single(sifts);
  
  %clusters making
  [codebook, codebookAssignments] = vl_kmeans(sifts, codebookSize);
  
  codebook = double(codebook);
 
  % soft assignment sifts to clusters found
  assignments = zeros(codebookSize, size(sifts, 2));
 
  for i = 1:numel(codebookAssignments)
    assignments(codebookAssignments(i), i) = 1;
  end
end

