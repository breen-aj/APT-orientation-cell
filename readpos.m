function [x,y,z,m]=readpos(file_name)
% function [x,y,m,z,M,sdm]=readpos(file_name, reso)
% Reads data from a .pos file (4 floats-big endian)
% and extract 4 matrixes with x,y,z and m


%% opens the file
fid = fopen(file_name, 'r');
disp('pos file is being read...');
%% Reads through the file made of 4 floats
lflo=fread(fid, inf, '4*float32', 'b');
%% Makes an array with the list of floats
nb=length(lflo)/4
flo=reshape(lflo, [4 nb]);
clear lflo
%% Creates output
x=flo(1,:);
y=flo(2,:);
z=flo(3,:);
m=flo(4,:);
%% Closes the file
fclose(fid);
disp('OK, file read, variables created.');

