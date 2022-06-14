function recovered_img_One_D_vector = decod_runLength(recovered_signal)
    recovered_img_One_D_vector =[];
    e = 1:size(recovered_signal,2);                 %vec =[1,2,3,4,5,6,,7,8....]
    pix_count_idx_vector = find(rem(e,2));          %odd = [1,3,5,7,9....]
    pix_value_idx_vector = find(~rem(e,2));         %even = [2,4,6,8....]
    a=1;
    while (a<=size(pix_value_idx_vector,2))
        for i=1:recovered_signal(pix_count_idx_vector(a))
            recovered_img_One_D_vector=[recovered_img_One_D_vector      recovered_signal(pix_value_idx_vector(a))];
        end
        a=a+1;
    end
end