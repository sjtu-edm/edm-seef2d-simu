% main function
clear all;
clc;
set_parameters;
init_process;
%for st = 1:set_step
for st = 1:100
    fprintf('--- Current Step Number: %d\n', st)
    fprintf('--- %d: Now start cutting process\n', st)
    cut_process;
    fprintf('--- %d: Cutting process finished, now movement process\n', st)
    movement_process;
    fprintf('--- %d: Movement process finished.\n', st)
    if (mod(st, 10) == 0)
    plot_process;
    end
    fprintf('--- Step %d finished.\n\n', st)
end