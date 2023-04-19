function Set_Output_port_sort(str)
    Name_Length = length(str);
    for i = 1: Name_Length
        Block_Name = find_system(gcs,'SearchDepth','1','BlockType','Outport','Name',str{i});
        if isempty(Block_Name)
            disp(str{i})
            error('No found the block!')
        end
        set_param(Block_Name{:},'Port',num2str(i))
    end
end
