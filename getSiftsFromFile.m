function [ sifts ] = getSiftsFromFile( filePath, siftNumber )
%  returns a set of sifts extracted from image file
  switch nargin 
      case 1
          siftNumber = [];
  end

  imageMatrixRGB = imread(filePath);
  imageMatrixGS = single(rgb2gray(imageMatrixRGB));
  [~, sifts] = vl_sift(imageMatrixGS);
  
  sifts = double(sifts);
  
  if ~isempty(siftNumber)
    sifts = vl_colsubset(sifts, siftNumber);
  end 
end

