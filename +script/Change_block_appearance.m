%%
%Author
BlockType = 'Constant';
Block_List = find_system(gcs,'SearchDepth',1,'BlockType',BlockType);
if length(Block_List)>=2
    Block_Size_Set = get_param(Block_List{1},'Position');
    for i = 2 : length(Block_List)
        Block_Size_now = get_param(Block_List{i},'Position');
        set_param(Block_List{i},'Position',[Block_Size_now(1) Block_Size_now(2)...
            Block_Size_now(1)+Block_Size_Set(3)-Block_Size_Set(1)...
            Block_Size_now(2)+Block_Size_Set(4)-Block_Size_Set(2) ]);
    end
    disp('Complete!')
else
    disp('Failure!')
end

%%
%clear vars
clear BlockType Block_List i Block_Size_Set