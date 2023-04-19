function Set_Customed_Output_Name_of_Subsystem(name,subsystem_handles)
    Name_Len = length(name);
    Subsystem_Output_Handles = get(subsystem_handles,'Porthandles');
    Subsystem_Output_Handles = Subsystem_Output_Handles.Outport;
    Number_of_Subsystem_Output = length(Subsystem_Output_Handles);
    if (Name_Len ~= Number_of_Subsystem_Output)
        error('Dimension mismatch');
    end
    for i = 1: Name_Len
        set(Subsystem_Output_Handles(i),'Name',name{i})
    end
end