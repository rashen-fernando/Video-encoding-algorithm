function inv_zigzag = inverseZigZag(recov_run_length,macrobock_size,rvec,cvec,y,x)
        a=1;
       
        inv_zigzag = {};
       
        col=1;row=1;
        while(a<size(recov_run_length,2))
            one_block = recov_run_length(a:a+macrobock_size*macrobock_size-1);
            
            temp_block=ones(macrobock_size);
            for elemant=1:macrobock_size*macrobock_size
                temp_block( rvec(elemant), cvec(elemant) )=one_block(elemant);
            end
            
            if(col<=x)
                inv_zigzag(row,col) = {temp_block};
                col=col+1;
            else
                col=1;
                row=row+1;
                inv_zigzag(row,col) = {temp_block};
                col=col+1;
            end
            a=a+macrobock_size*macrobock_size;
        end
end

%recov_run_length - One long vector.this is to e converted to a 2d matrix
%macro block size - numer of pixels in a side of a macroblock
%rvec,cvec - how zigzag indices are organized
%y - number of macroblocks in height direction of the image.(row )
%y - number of macroblocks in length direction of the image.(column )
%check --->inv_zigzag = inverseZigZag((1:18),3,[1,1,2,3,2,1,],[1,2,1,2],2,1)