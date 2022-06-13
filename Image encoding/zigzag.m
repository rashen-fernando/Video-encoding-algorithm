function [row_ind_vec,column_ind_vec] = zigzag(x)
row_ind_vec = [];
column_ind_vec = [];
    for n = 1:size(x,1)*2-1
        [i,j]=sort_indices(n,size(x,1));
        row_ind_vec = [row_ind_vec i];
        column_ind_vec = [column_ind_vec j];
    end
    
end