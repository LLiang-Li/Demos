function sl_customization(cm)

  %% Register custom menu function.
  cm.addCustomMenuFcn('Simulink:ContextMenu', @getMyMenuItems);
end

%% Define the custom menu function.
function schemaFcns = getMyMenuItems(callbackInfo) 
% schemaFcns = {@getItem1, ...
%                @getItem2, ...
%                {@getItem3,3}, ... %% Pass 3 as user data to getItem3.
%                @getItem4}; 
  schemaFcns = {@getItem1, @getItem2, @getItem3}; 
end

%% Define the schema function for first menu item.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
function schema = getItem1(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Code Generation';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback1; 
end

function myCallback1(callbackInfo)
      % 此处显示命令摘要
    disp('***************************************************************************************************')
    disp('*                                                                                                 *')
    disp('*                                     Code Generate                                               *')
    disp('*                                                                                                 *')
    disp('***************************************************************************************************')

    if(~isempty(bdroot))
        try
            rmdir slprj\ s
            disp('***************************************************************************************************')
            disp('Delete slprj fold!')
        catch
        end
        folder_name = [bdroot '*'];
        try
            rmdir(folder_name,'s')
            disp('***************************************************************************************************')
            disp('Delete folder of code generation of the model!')
        catch
        end
        try 
            delete(['*.slxc'])
            disp('***************************************************************************************************')
            disp('Delete the temp file of the model!')
        catch
        end
        clear folder_name;
        try
            disp('***************************************************************************************************')
            disp(['Model Name:   ' bdroot])
            disp('***************************************************************************************************')
            disp('Start code genration')
            slbuild(bdroot)
            disp('***************************************************************************************************')
            disp('Completed!')
            disp('***************************************************************************************************')
        catch
            disp('***************************************************************************************************')
            disp('Failure!')
            disp('***************************************************************************************************')
        end
    else
        disp('***************************************************************************************************')
        disp('No opened model')
        disp('***************************************************************************************************')
    end
    disp('***************************************************************************************************')
    disp('*                                                                                                 *')
    disp('*                                               END                                               *')
    disp('*                                                                                                 *')
    disp('***************************************************************************************************')
end
%% Define second item

function schema = getItem2(callbackInfo)
  % Make a submenu label 'Item Two' with     
  % the menu item above three times.      
  schema = sl_container_schema;
  schema.label = 'Change Block Appearance!';     
	schema.childrenFcns = {@getItem2_1, @getItem2_2};
end 

%item show content
function schema = getItem2_1(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Set Block'' Type';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback2_1; 
end

%item show content
function schema = getItem2_2(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Set Block'' Appearance';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback2_2; 
end

%callback
function myCallback2_1(callbackInfo)
    edit script.Change_block_appearance;
end

%callback
function myCallback2_2(callbackInfo)
    script.Change_block_appearance;
end

%% Define third iteam
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function schema = getItem3(callbackInfo)
  % Make a submenu label 'Item Two' with     
  % the menu item above three times.      
  schema = sl_container_schema;
  schema.label = 'Set Signals!';     
	schema.childrenFcns = {@getItem3_1, @getItem3_2, @getItem3_3};
end 

%item content
function schema = getItem3_1(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Set Signals''s Name Only';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback3_1; 
end

%item content
function schema = getItem3_2(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Set Signals''s Name with Signals';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback3_2; 
end

%item content
function schema = getItem3_3(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Delete Signals''s Name';
  %schema.userdata = 'item one';	
  schema.callback = @myCallback3_3; 
end

%callback
function myCallback3_1(callbackInfo)
    script.Set_Signals_Name('off');
end

%callback
function myCallback3_2(callbackInfo)
    script.Set_Signals_Name('on');;
end

%callback
function myCallback3_3(callbackInfo)
    script.Delete_Signals_Name;
end