macroblock_size = 8;
%read image
v = VideoReader("E:\sem 7\image vvideo coding\project\video_trim.mp4");
frame1 = rgb2gray(readFrame(v));
frame1 = imcrop(frame1,[0 0   macroblock_size*floor(size(frame1,2)/macroblock_size)  macroblock_size*floor(size(frame1,1)/macroblock_size) ]);
first_frame = frame1;
%[compress_frame1,dict,rvec,cvec,y,x] = compressImage(frame1,macroblock_size);
%IMG1 = decoderesidual(compress_frame1,dict,rvec,cvec,y,x,macroblock_size);
%[IMG1,~,~] = macroblocks(uint8(cell2mat(IMG1)),macroblock_size);


[IMG1,~,~] = macroblocks(frame1,macroblock_size);
transmitRES={};
transmitMV={};
transmitDICT={};
for i=1:10
    [IMG1,~,~] = macroblocks(uint8(frame1),macroblock_size);
    frame2 = rgb2gray(readFrame(v));
    frame2 = imcrop(frame2,[0 0   macroblock_size*floor(size(frame2,2)/macroblock_size)  macroblock_size*floor(size(frame2,1)/macroblock_size) ]);
    
    [IMG2,~,~] = macroblocks(frame2,macroblock_size);
    mv_array = MotionVecArray(IMG1,IMG2,4);
    motionCompensatedIMG = motionCompensation(IMG1,mv_array);
    
    residual = double(frame2)- double(cell2mat(motionCompensatedIMG));
    frame1 = residual+double(cell2mat(motionCompensatedIMG));
    [code,dict,rvec,cvec,y,x] = compressImage(residual,macroblock_size);
    transmitRES(i)= {code};
    transmitMV(i) = {mv_array};
    transmitDICT(i) = {dict};
    %recov_residual = decoderesidual(code,dict,rvec,cvec,y,x,macroblock_size);
    %reconstructed_new_ref_image = double(cell2mat(recov_residual))+double(cell2mat(motionCompensatedIMG));
end
transmit = {rvec cvec y x first_frame};
% imshow((cell2mat(motionCompensatedIMG)));

% imshow((residual));


% pic = residual+double(cell2mat(motionCompensatedIMG));

% imshow(uint8(pic));

% imshow(cell2mat(recov_residual))

% imshow(uint8(reconstructed_new_ref_image))
