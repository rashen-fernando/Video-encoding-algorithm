macroblock_size = 16;
%read image
v = VideoReader("E:\sem 7\image vvideo coding\project\video_trim.mp4");
frame1 = rgb2gray(readFrame(v));
frame2 = rgb2gray(readFrame(v));
%crop image to fit macroblocks
frame1 = imcrop(frame1,[0 0   macroblock_size*floor(size(frame1,2)/macroblock_size)  macroblock_size*floor(size(frame1,1)/macroblock_size) ]);
frame2 = imcrop(frame2,[0 0   macroblock_size*floor(size(frame2,2)/macroblock_size)  macroblock_size*floor(size(frame2,1)/macroblock_size) ]);


[IMG1,img_y,img_x] = macroblocks(frame1,macroblock_size);
[IMG2,img_y,img_x] = macroblocks(frame2,macroblock_size);
motionCompensatedIMG = motionCompensation(IMG1,mv_array);
mv_array = MotionVecArray(IMG1,IMG2,4);
%imshow(cell2mat(motionCompensatedIMG ))