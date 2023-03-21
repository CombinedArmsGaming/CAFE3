f_map_radioAssignments = createHashMap;

// ACRE2 Settings
// Modified from the original F3_CA ACRE configuration, by the CAFE team.
// Credits: Please see the CAFE repository (https://github.com/CombinedArmsGaming/CAFE3/graphs/contributors)
// ====================================================================================

// RADIO STRUCTURE

// Standard Short
// REMEMBER - IN ACRE, an ItemRadio will be automatically turned into an ACRE_PRC343!
f_var_acre_standardSHRadio = "ACRE_PRC343";

// Standard Long-range
f_var_acre_standardLRRadio = "ACRE_PRC152";

// 'Extra' LR radio
f_var_acre_extraRadio = "ACRE_PRC148";

// Backpack Radio
f_var_acre_backpackRadio = "ACRE_PRC117F";

[f_var_acre_standardSHRadio, west] call f_fnc_acre_giveRadioToAllUnits;
[f_var_acre_standardLRRadio, west, "sl"] call f_fnc_acre_giveRadioToAllInRole;
[f_var_acre_standardLRRadio, west, "ftl"] call f_fnc_acre_giveRadioToAllInRole;
[f_var_acre_backpackRadio, west, "eng", "COMMAND"] call f_fnc_acre_giveRadioToRoleInGroup;

[f_var_acre_standardLRRadio, west, "eng"] call f_fnc_acre_removeRadioFromAllInRole;


// ====================================================================================
// BABEL API

// Defines the languages that exist in the mission.
// string id, displayname
f_arr_acre_languageMap =
[
    ["blu", "Friendlese"],
    ["ind", "Foreignese"],
    ["opf", "Enemese"],
    ["civ", "Civilish"]
];


// defines the language that a player can speak.
// can define multiple
f_arr_acre_languages_blufor = ["blu"];
f_arr_acre_languages_opfor = ["ind"];
f_arr_acre_languages_indfor = ["opf"];
f_arr_acre_languages_civilian = ["civ"];


// Defines the radio net each side uses.
// If you want some sides to share nets, match the nets.
f_var_acre_bluforRadioNet = "BLU NET";
f_var_acre_opforRadioNet = "OPF NET";
f_var_acre_indforRadioNet = "IND NET";
f_var_acre_civilianRadioNet = "CIV NET";


// ====================================================================================
// Short-range channels.
// These are normally used for communication within a team or group.
// Examples: A1 net composed of FTL, Riflemen, Medic etc.  Partisan/guerrilla comms for localised coordination.
f_arr_acre_sr_groups_blufor =
[
    ["ALPHA",    ["ALPHA"]],
    ["BRAVO",    ["BRAVO"]],
    ["CHARLIE",    ["CHARLIE"]],
    ["COMMAND",    ["COMMAND"]]
];

f_arr_acre_sr_groups_opfor = f_arr_acre_sr_groups_blufor;
f_arr_acre_sr_groups_indfor = f_arr_acre_sr_groups_blufor;
f_arr_acre_sr_groups_civilian = f_arr_acre_sr_groups_blufor;


// Long-range channels.
// These channels are shared with 'extra' long-range (XLR) radios and backpack radios.  You should duplicate these channels in the XLR list.
//
// These channels are normally used for squad-level communication.
// Examples: Alpha net composed of ASL, A1, A2.  Section net composed of ASL, A2IC, AMED.  Mechanised team composed of ASL, A-Vic.
f_arr_acre_lr_groups_blufor =
[
    ["GROUND CMD",    []],
    ["ALPHA NET",    ["ALPHA"]],
    ["BRAVO NET",    ["BRAVO"]],
    ["CHARLIE NET",    ["CHARLIE"]],
    ["HOTLINE ZEUS",    ["ZEUS"]]
];

f_arr_acre_lr_groups_opfor = f_arr_acre_lr_groups_blufor;
f_arr_acre_lr_groups_indfor = f_arr_acre_lr_groups_blufor;
f_arr_acre_lr_groups_civilian = f_arr_acre_lr_groups_blufor;


// 'Extra' long-range & backpack channels.
// These are shared with long-range (LR) radios and backpack radios.  You should duplicate these channels in the LR list.
// 
// These channels are normally used for platoon-level communication or higher.
// Examples: Ground command net composed of CO, ASL, BSL, CSL.  Vehicle net composed of XO/VC, A-Vic, B-Vic, CAS.  Liason net composed of CO, INDFOR CO.
f_arr_acre_xlr_groups_blufor =
[
    ["GROUND CMD",    ["ALPHA", "BRAVO", "CHARLIE", "COMMAND", "ZEUS"]],
    ["ALPHA NET",    []],
    ["BRAVO NET",    []],
    ["CHARLIE NET",    []],
    ["HOTLINE ZEUS",    []]
];

f_arr_acre_xlr_groups_opfor = f_arr_acre_xlr_groups_blufor;
f_arr_acre_xlr_groups_indfor = f_arr_acre_xlr_groups_blufor;
f_arr_acre_xlr_groups_civilian = f_arr_acre_xlr_groups_blufor;


// Role overrides per group.  Overrides are ["SR Label", "LR Label", "XLR Label"].
// Empty overrides have no effect - assignments from above will remain in place for these.
["fac", "COMMAND", ["", "", "AIR NET"]] call f_fnc_acre_forceRadioChannelsForRoleInGroup;


// ====================================================================================
// DO NOT EDIT UNDER THIS LINE.  Framework code acting upon the configuration above.

[] call f_fnc_initialiseRadioPresets;

{
    _x call acre_api_fnc_babelAddLanguageType;
} foreach f_arr_acre_languageMap;

// Used by other components to determine when all radio settings have been populated.
f_radios_loadedSettings = true;