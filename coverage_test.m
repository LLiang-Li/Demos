%%
model_name = bdroot;
test_scenarios = 7;
%

covData(test_scenarios) =  cvdata;
for i = 1 : test_scenarios  
    Active_Scenario_Index = i;
    covData(i) = cvsim(bdroot);
end

res = covData(1);
for i = 2 : test_scenarios
    res = res + covData(i);
end

cvmodelview(res)
