function [ fileList ] = getFilesOnly( dirName )

  % get folder content
  files = dir(dirName);
  
  % get rid of directories
  fileList = files(find([files.isdir] == 0));

end

