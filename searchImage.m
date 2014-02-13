function [ queryResultList ] = searchImage( queryPath, imageDataBase, codebook, resultsAmount)
% search for image with queryPath using accepted database
    % calculating query image VLAD
    searchFileVlad = getVlad(queryPath, codebook);
    
    % constructing VALD matrix using accepted data base
    temp   = [imageDataBase{:}]; 
    vlads  = [temp(:).vlad];

    % calculating distances (performing search - then less distance 
    % then closer result to source query
    results = vl_alldist2(vlads, searchFileVlad);

    % sorting the results
    [~, idxs] = sort(results);

    % getting first resAmount closest results
    resultIdxes = idxs(1:resultsAmount);
    
    queryResultList = cell(resultsAmount, 1);
    
    for i = 1:resultsAmount
        queryResultList{i} = imageDataBase{resultIdxes(i)}.fileName;
    end

    %disp(['query file name = ' queryPath]);

    % prepare params for result showing
    imageInColumn = 5;
    imageRows = ceil(resultsAmount/imageInColumn);
    

    if floor(resultsAmount/imageInColumn) == 0
        imageInColumn = resultAmount;
    end 

    % result showing
    for i = 1:numel(resultIdxes);
        [x, ~] = imread(queryResultList{i});
        subplot(imageRows, imageInColumn, i);
        subimage(x);
        % cut the file path
        title([num2str(resultIdxes(i)) ' -> ' queryResultList{i}(end-9:end)]);
        axis off;
    end
end

