function [C,img_y,img_x] = macroblocks(img,macroblock_size)
%img_y = number_of_macroblocks_per_height_of_the_image (rows)
%img_x = number_of_macroblocks_per_length_of_the_image (columns)
    number_of_macroblocks = size(img,1)*size(img,2)/(macroblock_size^2); 

    img_y = size(img,1)/macroblock_size ;               
    img_x = size(img,2)/macroblock_size ;               
          
    row_ratio_array = 8*ones(1,floor(img_y));          %refer mat2cell.how matrixx is divided in y direction
    column_ratio_array = 8*ones(1,floor(img_x));
    C = mat2cell(img,row_ratio_array ,column_ratio_array);
          
end