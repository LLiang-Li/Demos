function Generation_Inport_or_Outport(Block_Name,st)
    if nargin==1
        st = 1;
    end
    if nargin <1
        error('No find Block_Name')
    end
    open_system(new_system)
    Model_Name = bdroot;
    
    pos = nan;
    if st > 0
        Source = 'simulink/Sources/In1';
    else
        Source = 'simulink/Sinks/Out1';
    end
    for i = 1 : length(Block_Name)
        
        add_block(Source,[Model_Name '/' Block_Name{i}])
        
        Data_Type = Block_Name{i};
        if length(Data_Type)>=2
            switch Data_Type(2)
                case 'e'
                    set(gcbh,'OutDataTypeStr','uint8')
                case 'i'
                    set(gcbh,'OutDataTypeStr','int8')
                case 'u'
                    set(gcbh,'OutDataTypeStr','uint16')
                case 's'
                    set(gcbh,'OutDataTypeStr','int16')
                case 'l'
                    set(gcbh,'OutDataTypeStr','uint32')
                case 'n'
                    set(gcbh,'OutDataTypeStr','int32')
                case 'b'
                    set(gcbh,'OutDataTypeStr','boolean')
                case 'f'
                    set(gcbh,'OutDataTypeStr','single')
                otherwise
                    disp(Data_Type)
                    warning('Data Type Error!');
            end
        else
            warning([Data_Type ' with Data Type Error!'])
        end
        if isnan(pos)
            pos = get(gcbh,'position');
            continue;
        end
        
        pos([2 4]) = pos([2 4])+30;
        set(gcbh,'position',pos)
    end
end