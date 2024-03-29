f_arr_acre_vestRadios = ["ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC148", "ACRE_BF888S", "ACRE_SEM52SL"];
f_arr_acre_backpackRadios = ["ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"];
f_arr_acre_allRadios = f_arr_acre_vestRadios + f_arr_acre_backpackRadios;

// This map is needed because the ACRE team are big nerds.  See comment here:
// https://github.com/IDI-Systems/acre2/blob/master/extras/examples/mission_setupCompanySignals.sqf
f_map_acre_channelNameParameters = createHashMapFromArray
[
    ["ACRE_PRC152", "description"],
    ["ACRE_PRC148", "label"],
    ["ACRE_PRC117F", "name"]
];