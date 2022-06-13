function transformed=dct_full_image(img,macroblock_size,Q)  
%k1 = macroblock row index  
%k2 = macroblock column index
%macroblock_size = number of side pixels in a macroblock 
    for i = 1:size(img,1)
        for j = 1:size(img,2)
            transformed(i,j)={ floor(dct2(cell2mat(img(i,j)))./Q ) };
        end
    end
end