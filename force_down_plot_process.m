% imwrite(flipud(tool)*255, ['figure/tool_', num2str(Hw), '_', num2str(st), '.bmp'], 'bmp')
% imwrite(drill(1:drill_h, 1:drill_l)*255, ['figure/drill_', num2str(Hw), '_', num2str(st), '.bmp'], 'bmp')

temp_a = uint8(ones(drill_h + tool_h / 2, drill_l));
temp_a((tool_h/2)+1:(drill_h + tool_h/2), :) = drill;
flptl = flipud(tool(1:tool_h/2, 1:tool_w));
flptl1 = [fliplr(flptl) flptl];
temp_a((be_z+1):(be_z+tool_h/2), (be_x - tool_w):(be_x+tool_w-1)) = flptl1 & temp_a((be_z+1):(be_z+tool_h/2), (be_x-tool_w):(be_x+tool_w-1));
% figure(2*st-1)
% imshow(temp_a*255)
% -- Print Tool Wear
imwrite(temp_a*255, ['figure/Tool_wear/', 'force_down_', num2str(force_count_tot), '_', num2str(force_count), '_', num2str(be_x), '_', num2str(be_z), '_', num2str(st), '.bmp'], 'bmp')
hold off;
% -- Print Electric Field
% figure(2*st)
for di = range_z1:range_z2
    for dj = range_x1:range_x2
        if ((hass(di - range_z1 + 1, dj - range_x1 + 1)) && (d(di - range_z1 + 1, dj - range_x1 + 1) == 0))
            d(di - range_z1 + 1, dj - range_x1 + 1) = solv_x(hass(di - range_z1 + 1, dj - range_x1 + 1));
        end
    end
end

% -- Mark the cutting position
fprintf('------ Cutting positions:\nTool:%d, %d\nDrill:%d, %d\n', min_tool_z - range_z1 + 1, min_tool_x - range_x1 + 1, min_drill_z - range_z1 + 1, min_drill_x - range_x1 + 1);
% Save imagesc w/ popping out window, not a virus
f = figure(st);
imagesc(d)
colorbar
% SAVE PICS
saveas(f, ['figure/Electric_field/', 'force_down_', num2str(force_count_tot), '_', num2str(force_count), '_', num2str(be_x), '_', num2str(be_z), '_', num2str(st), '.bmp'], 'bmp')
close(f)
% hold off;

% -- Print Scanning Area
d1 = d((range_z1_s:range_z2) - range_z1 + 1, (range_x1_s:range_x2) - range_x1 + 1);

f1 = figure(st - 1);
imagesc(d1)
colorbar
% SAVE PICS
saveas(f1, ['figure/Scanning_area/', 'force_down_', num2str(force_count_tot), '_', num2str(force_count), '_', num2str(be_x), '_', num2str(be_z), '_', num2str(st), '.bmp'], 'bmp')
close(f1)


% imwrite(temp_a*255, ['figure/', num2str(be_x), '_', num2str(be_z), '.bmp'], 'bmp')
