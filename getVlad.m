function [ vlad ] = getVlad( fileName, codebook)
% calculate vald using filename and codebook

  sifts = getSiftsFromFile(fileName);
  assignment = vl_alldist2(sifts, codebook)';
  vlad = vl_vlad(sifts, codebook, assignment);
end

