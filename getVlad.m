function [ vlad ] = getVlad( fileName, codebook)
% calculate vald using filename and codebook

  sifts = getSiftsFromFile(fileName);
  assignment = vl_alldist2(sifts, codebook)';
  colSums = sum(assignment, 1);
  assignment = assignment./repmat(colSums, size(assignment, 1), 1);
  vlad = vl_vlad(sifts, codebook, assignment);
end

