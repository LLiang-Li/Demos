function  Set_Signals_Name(str)

if ~(strcmp(str,'on')||strcmp(str,'off'))
    error('Input Errors');
end

Inport_List = find_system(bdroot,'SearchDepth','1','BlockType','Inport');
for Inport_index = 1 : length(Inport_List)
    Port_Handles = get_param(Inport_List{Inport_index},'PortHandles');
    set(Port_Handles.Outport, 'Name', get_param(Inport_List{Inport_index}, 'Name'));
    set(Port_Handles.Outport,'MustResolveToSignalObject',str)
end

Subsustem_List = find_system(bdroot,'SearchDepth','1','BlockType','SubSystem');
for Subsystem_Index = 1 : length(Subsustem_List)
    Port_Connectiity = get_param(Subsustem_List{Subsystem_Index},'PortConnectivity');
    Out_Connect_handles = [Port_Connectiity.DstBlock];
    Subsystem_Port_Handles = get_param(Subsustem_List{Subsystem_Index},'PortHandles');
    for Out_Connect_handles_index = 1 : length(Out_Connect_handles)
        set(Subsystem_Port_Handles.Outport(Out_Connect_handles_index),'Name',...
            get(Out_Connect_handles(Out_Connect_handles_index),'Name'))
        set(Subsystem_Port_Handles.Outport(Out_Connect_handles_index),...
            'MustResolveToSignalObject',str)
    end  
end


