
function in_bd = bound_jdg(z, x, low_z, upp_z, low_x, upp_x)
    in_bd = 0;
    if (z >= low_z && z <= upp_z && x >= low_x && x <= upp_x)
        in_bd = 1;
    end
end
