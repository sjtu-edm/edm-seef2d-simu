if (st > data_thresh)
    fprintf('------ %d:Rolling current data\n', st)
    movefile('data_cur.mat', 'data_100.mat')
end
fprintf('------ %d: Saving data...\n', st)
save('data_cur.mat')
fprintf('------ %d: Data saved.\n', st)

