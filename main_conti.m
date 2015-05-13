% main function
% This file is only for continuing from last time

clear all;
clc;
% set_parameters;
% init_process;
load('data_100.mat');
% -- parameter change
tool_x_v = round(5 / unit_size);
% -- parameter change end
% make new folders 
mkdir('figure', 'Electric_Field')
mkdir('figure', 'Tool_wear')
mkdir('figure', 'Scanning_area')

% load('data.mat')
start_step = 1960;
fprintf('--- Now start simulation from step number %d\n\n', start_step)
for st = start_step:4000
    fprintf('--- Current Step Number: %d\n', st)
    fprintf('--- %d: Now start cutting process\n', st)
    cut_process;
    fprintf('--- %d: Cutting process finished, now movement process\n', st)
    movement_process;
    fprintf('--- %d: Movement process finished.\n', st)
    if (mod(st, 10) == 0)
        plot_process;
    end
    if ((mod(st, 100) == 0) && (st >= data_thresh))
	fprintf('--- Save workspace data to file for next running...\n')
        data_saving;
    end
    fprintf('--- Step %d finished.\n\n', st)
end
