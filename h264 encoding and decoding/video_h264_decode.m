rvec = cell2mat(transmit(1));
cvec = cell2mat(transmit(2));
y = cell2mat(transmit(3));
x = cell2mat(transmit(4));
first_frame = cell2mat(transmit(5));
[IMG1,~,~] = macroblocks(first_frame,macroblock_size);

v = VideoWriter('newfile.avi');
open(v)

for i=1:size(transmitRES,2)
     mv_array = transmitMV{1,i};
     code = cell2mat(transmitRES(i));
     dict = transmitDICT{1,i};
     recov_residual = decoderesidual(code,dict,rvec,cvec,y,x,macroblock_size);
     motionCompensatedIMG = motionCompensation(IMG1,mv_array);
     frame = uint8(double(cell2mat(motionCompensatedIMG))+cell2mat(recov_residual));
     [IMG1,~,~] = macroblocks(frame,macroblock_size);
     writeVideo(v,frame);
end

close(v);