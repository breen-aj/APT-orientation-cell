function [l, l2] = orientation_cell_reconstruction_X(g, UC_name, pos_name)

%this code adds an orientation reference cube/cell to a .pos atom probe reconstruction
%to facilitate measurements of crystallographic relationships e.g. habit
%planes of precipitates and other microstuctrural phenomina such as dislocations and associated segregation behaviour.

%g: the orientation matrix of the crystal of interest
%type: the type of crystal: cubic or hexagonal (other crystal types have
%not been added yet)
%name: the file name .png

%outputs: 
%l: the line end co-ordinates of the box aligned with the x,y,z axis
%l2: the line end co-ordinates rotated to new orientation

%% Author: Andrew John Breen 
%email: andrew.breen@sydney.edu.au, 2024
%Australian Centre for Microscopy and Microanalysis (ACMM), The University of Sydney
%written and tested in MATLAB R2022b

%% BSD 2-Clause License
% 
% Copyright (c) 2024, Breen AJ
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 
% 1. Redistributions of source code must retain the above copyright notice, this
%    list of conditions and the following disclaimer.
% 
% 2. Redistributions in binary form must reproduce the above copyright notice,
%    this list of conditions and the following disclaimer in the documentation
%    and/or other materials provided with the distribution.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%% main
%how big do you want the unit cell dims to be
a = 20; %nm
step = 0.1; %nm
lpts = a/step+1;


%% cell atoms (cubic)

%[001] starting at 0,0,0
l{1} = zeros(lpts,3); 
l{1}(:,3) = 0:step:a;

%[001] starting at 0,1,0
l{2} = zeros(lpts,3);
l{2}(:,3) = 0:step:a;
l{2}(:,2) = a;

%[001] starting at 1,1,0
l{3} = zeros(lpts,3); 
l{3}(:,3) = 0:step:a;
l{3}(:,1:2) = a;

%[001] starting at 1,0,0
l{4} = zeros(lpts,3); 
l{4}(:,3) = 0:step:a;
l{4}(:,1) = a;

%[010] starting at 0,0,0
l{5} = zeros(lpts,3); 
l{5}(:,2) = 0:step:a;

%[010] starting at 0,0,1
l{6} = zeros(lpts,3); 
l{6}(:,2) = 0:step:a;
l{6}(:,3) = a;

%[010] starting at 1,0,1
l{7} = zeros(lpts,3); 
l{7}(:,2) = 0:step:a;
l{7}(:,[1,3]) = a;

%[010] starting at 1,0,0
l{8} = zeros(lpts,3); 
l{8}(:,2) = 0:step:a;
l{8}(:,1) = a;

%[100] starting at 0,0,0
l{9} = zeros(lpts,3); 
l{9}(:,1) = 0:step:a;

%[100] starting at 0,0,1
l{10} = zeros(lpts,3); 
l{10}(:,1) = 0:step:a;
l{10}(:,3) = a;

%[100] starting at 0,1,1
l{11} = zeros(lpts,3); 
l{11}(:,1) = 0:step:a;
l{11}(:,[2,3]) = a;

%[100] starting at 0,1,0
l{12} = zeros(lpts,3); 
l{12}(:,1) = 0:step:a;
l{12}(:,2) = a;


%% figure

Marker_size = 2; %marker size
l2 = cell(1,12);
h = cell(1,12);


%% figure
fig_dim_x = 8;
fig_dim_y = 8;

fig = figure('Units', 'centimeters');
fig.Position = [5,5,fig_dim_x, fig_dim_y];

f_size = 9;

hold on

    for i =1:12
        l2{i} = mtimes(inv(g), l{i}'); %g\l{i}
        if i == 1
            h{i} = plot3(l2{i}(1,:)', l2{i}(2,:)', l2{i}(3,:)', 'o', 'Markersize', Marker_size, 'color', 'b');
        elseif i == 5
            h{i} = plot3(l2{i}(1,:)', l2{i}(2,:)', l2{i}(3,:)','o', 'Markersize', Marker_size, 'color', 'g');
        elseif i == 9
            h{i} = plot3(l2{i}(1,:)', l2{i}(2,:)', l2{i}(3,:)', 'o', 'Markersize', Marker_size, 'color', 'r');
        else
           h{i} = plot3(l2{i}(1,:)', l2{i}(2,:)', l2{i}(3,:)', 'o', 'Markersize', Marker_size, 'color', 'k');
        end
        
    end

%set axis limit
%find the minimum and maximum extents of l2

minX = inf;
minY = inf;
minZ = inf;

maxX = -inf;
maxY = -inf;
maxZ = -inf;

for i=1:12

    minX_temp = min(l2{i}(1,:));
    minY_temp = min(l2{i}(2,:));
    minZ_temp = min(l2{i}(3,:));

    maxX_temp = max(l2{i}(1,:));
    maxY_temp = max(l2{i}(2,:));
    maxZ_temp = max(l2{i}(3,:));

    if minX_temp < minX
        minX = minX_temp;
    end

    if minY_temp < minY
        minY = minY_temp;
    end

    if minZ_temp < minZ
        minZ = minZ_temp;
    end

     if maxX_temp > maxX
        maxX = maxX_temp;
    end

    if maxY_temp > maxY
        maxY = maxY_temp;
    end

    if maxZ_temp > maxZ
        maxZ = maxZ_temp;
    end

end

%extents of fig
xlim([minX-5 maxX+5])
ylim([minY-5 maxY+5])
zlim([minZ-5 maxZ+5])

xlabel('x')
ylabel('y')
zlabel('z')

axis equal
axis vis3d
%axis off

%view(az,el) from normal to the xz-plane in positive y direction
view(2)
%view([90, 90]) %use this for OIM ???
%view([0, 90])%use for OIM (seems to work with setting 2)
%view([-90 90])


%set(gca,'Xcolor', 'k', 'Ycolor','k', 'fontsize', f_size, 'linewidth', 1, 'box', 'off', 'fontname', 'Arial')


set(gcf, 'PaperPositionMode','auto');
set(gcf, 'InvertHardCopy', 'off');
set(gcf, 'color', 'white');
%f = getframe(gcf);       
%imwrite(f.cdata, [csv_file 'mspec.tif'],'tif');
export_fig(UC_name, '-png', '-r500', '-nocrop');        

%% add to a .pos file

[x,y,z,m] = readpos(pos_name);

%add atoms of reference cube
x2 = [];
y2 = [];
z2 = [];
m2 = [];

for i =1:12
            x2 = [x2 l2{i}(1,:)];
            y2 = [y2 l2{i}(2,:)];
            z2 = [z2 l2{i}(3,:)];       
end

%shift unit cell to bottom left corner
%find extents of pos file

minx_pos = min(x);
miny_pos = min(y);
minz_pos = min(z);

x2 = x2 - (maxX - minx_pos)- 5;
y2 = y2 - (maxY - miny_pos)- 5;
z2 = z2 - (minZ - minz_pos);

m2 = ones(1, length(x2))*1000;

x = [x x2];
y = [y y2];
z = [z z2];
m = [m m2];

savepos(x,y,z,m, [pos_name '_ref_cube.pos']);

end
    
    
