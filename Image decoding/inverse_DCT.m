function inv_DCT = inverse_DCT(img)
    inv_DCT={};
    for y=1:size(img,1)
        for x= 1:size(img,2)
            inv_DCT(y,x)={idct2( cell2mat(img(y,x)) )};
        end
    end
end