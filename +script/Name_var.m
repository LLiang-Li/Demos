function Name_var(str)

load('Name_Rule.mat');

if (str(1) >= 90)
    str(1) = str(1) - 32;
end
%disp(str)
idx = strfind(Keyword, str);
index = [];
inx = 1;
for i = 1 : length(Keyword)
    if ~(isempty(idx{i}))
        index(inx) = i;
        inx = inx + 1;
    end
end
if ~isempty(index) > 0
    for i = 1 : length(index)
        disp([Keyword(index(i)) ':' Abb(index(i))])
    end
else
    disp('Not find')
end
clear Abb      Keyword  i        idx      index    inx      str     