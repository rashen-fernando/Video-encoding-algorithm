%decoding recieved signal - huffman
recovered_signal = huffmandeco(code,dict);

%decoding runlength _____(run_L_coded ------->img_One_D_vector)
recov_run_length = decod_runLength(recovered_signal);

%inverse zigzag ______(img_One_D_vector--------->DCT_tf_img)
recov_DCT_tf_img =inverseZigZag(recov_run_length,macrobock_size,rvec,cvec,y,x);

%inverse dct_____(recovered_dct_tf---->recovered img)
recov_IMG = inverse_DCT(recov_DCT_tf_img);

%DISPLAY IMAGE
imshow(cell2mat(recov_IMG));