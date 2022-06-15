function motionCompensatedIMG = motionCompensation(image1,mvarray)
    motionCompensatedIMG={};
    for y=1:size(image1,1)
        for x=1:size(image1,2)
            temp=cell2mat(mvarray(y,x));
            y_pos = y+temp(1);
            x_pos = x+temp(2);
            motionCompensatedIMG(y,x)=image1(y_pos,x_pos);
        end
    end
end