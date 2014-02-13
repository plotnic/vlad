function [ vlad ] = getVlad( fileName, codebook, assignment )
% calculate vald using filename and codebook

  sifts = getSiftsFromFile(fileName);
  vlad = vl_vlad(sifts, codebook, assignment);
end

