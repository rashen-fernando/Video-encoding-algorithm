function [motion_vec,y_pos,x_pos] = motion_estimate(image1,window, block,block_index)   
%input the macroblock from image2 to be searched and the window[x0 y0 x1 y1].As results it provide the motion vector in [y x] format
    motion_vec=[];
    score=100000000000000000000000000000;
    y_pos=0;x_pos=0;
    for y=window(2):window(4)
        for x=window(1):window(3)
            
            mmse = sum(sum(abs(cell2mat(block)-cell2mat(image1(y,x))).^2));
            
            if(mmse<score)
                score=mmse;
                motion_vec  = [(y-block_index(1)) (x-block_index(2))];
                y_pos = y;
                x_pos = x;
            else
                score=score;
                motion_vec =  motion_vec;
            end
        end
    end
    
end

%mse = sum(sum(abs(h.^2-k.^2)))



% 
% function [motion_vec,y_pos,x_pos] = motion_estimate(image1,window, block,block_index)   
% %input the macroblock from image2 to be searched and the window[x0 y0 x1 y1].As results it provide the motion vector in [y x] format
%     motion_vec=[];
%     score=100000000000000000000000000000;
%     y_pos=0;x_pos=0;
%     for y=window(2):window(4)
%         for x=window(1):window(3)
%             
%             mmse = sum(sum(abs(cell2mat(block)-cell2mat(image1(y,x))).^2));
%             
%             if(mmse<score)
%                 score=mmse;
%                 motion_vec  = [(block_index(1)-y) (block_index(2)-x)];
%                 y_pos = y;
%                 x_pos = x;
%             else
%                 score=score;
%                 motion_vec =  motion_vec;
%             end
%         end
%     end
%     
% end
% 
% %mse = sum(sum(abs(h.^2-k.^2)))
