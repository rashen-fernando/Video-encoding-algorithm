function [code,dict,rvec,cvec,y,x]=compressImage(img,macrobock_size)
%important - change Q according to macroblok size 
    %Q = [80 60 50 80 120 200 255 255; 55 60 70 95 130 255 255 255; 70 65 80 120 200 255 255 255;70 85 110 145 255 255 255 255; 90 110 185 255 255 255 255 255;120 175 255  255 255 255 255 255;    245 255 255 255 255 255 255 255;     255 255 255 255 255 255 255 255];
    Q=ones(8);
    [IMG,y,x]=macroblocks(img,macrobock_size);
    DCT_tf_img = dct_full_image(IMG,macrobock_size,Q);

%-----------zig zag-------------------------------------------------------
    [rvec,cvec] = zigzag(cell2mat(DCT_tf_img(1,1)));
    img_One_D_vector = oneMblockVec(DCT_tf_img,macrobock_size,rvec,cvec);
%-------run length code----------------------------------------------------
    run_L_coded = run_length_coding(cell2mat(img_One_D_vector)); 

%--------huffman------------------------------------------------------------
    [g,~,intensity_val] = grp2idx(run_L_coded);
    Frequency = accumarray(g,1);
    [intensity_val Frequency];
    proability = Frequency./sum(Frequency);
    dict = huffmandict(intensity_val,proability);
    code = huffmanenco(run_L_coded,dict);
end