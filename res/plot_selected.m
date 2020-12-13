clc
close all
clear variables

% skeletal code for ME20016 by Jens Roesner
% University of Bath, 2015, 2019
% This uses a very, very lightly modified readColData.m written by Gerald Recktenwald
% original version here:
% https://web.cecs.pdx.edu/~gerry/MATLAB/programming/intermediate.html

homedir='pwd';

[filelist,dirlist]=uigetfile('.txt','select file(s will be plotted together)','multiselect','on');

if class(filelist)=='char'
    numfiles=1;
    filelist=cellstr(filelist);
else
    numfiles=length(filelist);
    filelist=sort(filelist);
end

figure(1)
for kk=1:numfiles
    [labels,data]=readColData([dirlist filelist{kk}],3,7);
    legendcell{kk}=strrep(filelist{kk}(1:end-4),'_',' ');
    
    subplot(1,2,1)
    xlabel('displacement [mm]')
    ylabel('force [kN]')
    hold all
    grid on
    plot(data(:,2),data(:,1))
        
    subplot(1,2,2)
    xlabel('velocity [Volt]')
    ylabel('force [kN]')
    hold all
    grid on
    plot(data(:,3),data(:,1))
    
    legend(legendcell)
end



fclose('all');

