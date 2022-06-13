function [i,j] = sort_indices(n,macroblock_size)
    a = macroblock_size - abs(n-macroblock_size);
    b = n-macroblock_size;
    i=[];j=[];
    if(~rem(n,2)) %if n even i is ascending j is descending
%--------------------------------------------------------------------------        
        if(b<=0) %b<=0 range is 1 to a else range begins from macroblock_size
            for m=1:a
                i = [i m];
                j = [m j];
            end
        else
            for m = macroblock_size-(a-1):macroblock_size
                i = [i m];
                j = [m j];
            end
        end
 %-------------------------------------------------------------------------     
    else
 %-------------------------------------------------------------------------       
        if(b<=0) %b<=0 range is 1 to a else range begins from macroblock_size
            for m=1:a
                i = [m i];
                j = [j m];
            end
        else
            for m = macroblock_size-(a-1):macroblock_size
                i = [m i];
                j = [j m];
            end
        end
%--------------------------------------------------------------------------        
    end
end