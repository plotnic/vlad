function [ fileVladStruct ] = getFileValdStruct( fileName, fileVlad )
% returns structure for storing file vlads
  fileVladStruct = struct(...
        'fileName', fileName, ...
        'vlad', fileVlad);
end

