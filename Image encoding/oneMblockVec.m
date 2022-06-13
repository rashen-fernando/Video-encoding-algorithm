function one_img_vector = oneMblockVec(image,macroblock_size,row_ind_vec,column_ind_vec)
    one_img_vector ={};
    for y = 1:size(image,1)
        for x = 1:size(image,2)
            macroblock = cell2mat(image(y,x));
            temp_block=[];
            for a = 1:size(row_ind_vec,2)
                temp1 = row_ind_vec(a);
                temp2 = column_ind_vec(a);
                %one_img_vector = [one_img_vector  macroblock(temp1,temp2) ];
                temp_block=[temp_block  macroblock(temp1,temp2)];
            end
            one_img_vector =[one_img_vector   {temp_block}];
        end
    end
    
    
end