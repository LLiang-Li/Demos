function  Delete_Signals_Name

Inport_List = find_system(bdroot,'SearchDepth','1','BlockType','Inport');
for Inport_index = 1 : length(Inport_List)
    Port_Handles = get_param(Inport_List{Inport_index},'PortHandles');
    set(Port_Handles.Outport, 'Name', '');
    set(Port_Handles.Outport,'MustResolveToSignalObject','off')
end

Subsustem_List = find_system(bdroot,'SearchDepth','1','BlockType','SubSystem');
for Subsystem_Index = 1 : length(Subsustem_List)
    Port_Connectiity = get_param(Subsustem_List{Subsystem_Index},'PortConnectivity');
    Out_Connect_handles = [Port_Connectiity.DstBlock];
    Subsystem_Port_Handles = get_param(Subsustem_List{Subsystem_Index},'PortHandles');
    for Out_Connect_handles_index = 1 : length(Out_Connect_handles)
        set(Subsystem_Port_Handles.Outport(Out_Connect_handles_index),'Name',...
            '')
        set(Subsystem_Port_Handles.Outport(Out_Connect_handles_index),...
            'MustResolveToSignalObject','off')
    end  
end


