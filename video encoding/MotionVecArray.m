function mv_array = MotionVecArray(image1,image2,w)
%image1 - cell array if image1
%image2 - cell array if image2
%w= window size - 4
    mv_array = {};
    window = ones(1,4);
    for y=1:size(image2,1)
        for x=1:size(image2,2)
            %-------determining window limits------------------------------
            %-------x0 in window-------------------------------------------
            if (x-w<1)
                window(1) = 1;
            else
                window(1) = x-w;
            end
            %-------y0 in window-------------------------------------------
            if (y-w<1)
                window(2) = 1;
            else
                window(2) = y-w;
            end
            %-------x1 in window-------------------------------------------
            if (x+w>size(image2,2))
                window(3) = size(image2,2);
            else
                window(3) = x+w;
            end
            %-------y1 in window-------------------------------------------
            if (y+w>size(image2,1))
                window(4) = size(image2,1);
            else
                window(4) = y+w;
            end
            
            %motion vector determination for each block
            [motion_vec,~,~] = motion_estimate(image1,window,image2(y,x),[y x]);
            mv_array(y,x)={motion_vec};
        end
    end
end














% 
% function mv_array = MotionVecArray(image1,image2,w)
% %image1 - cell array if image1
% %image2 - cell array if image2
% %w= window size - 4
%     mv_array = {};
%     window = ones(1,4);
%     for y=1:size(image2,1)
%         for x=1:size(image2,2)
%             %-------determining window limits------------------------------
%             %-------x0 in window-------------------------------------------
%             if (x-w<1)
%                 window(1) = 1;
%             else
%                 window(1) = x-w;
%             end
%             %-------y0 in window-------------------------------------------
%             if (y-w<1)
%                 window(2) = 1;
%             else
%                 window(2) = y-w;
%             end
%             %-------x1 in window-------------------------------------------
%             if (x+w>size(image2,2))
%                 window(3) = size(image2,2);
%             else
%                 window(3) = x+w;
%             end
%             %-------y1 in window-------------------------------------------
%             if (y+w>size(image2,1))
%                 window(4) = size(image2,1);
%             else
%                 window(4) = y+w;
%             end
%             
%             %motion vector determination for each block
%             [motion_vec,y_pos,x_pos] = motion_estimate(image1,window,image2(y,x),[y x]);
%             mv_array(y_pos,x_pos)={motion_vec};
%         end
%     end
% end