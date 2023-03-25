/*
    ACRE2 Settings File

    Use this file to set up a radio net for your mission.  All sides can be configured differently, and all ACRE radios can be used.


    COMMAND ARGUMENTS REFERENCE:

        _radio - String
            Name of the radio to give to the units.  This is the class-name of the radio.  For examples, see 'components\radio\acre\globals.sqf'.
        
        _channelName - String
            Name of the channel the radio should be tuned to.  If the channel doesn't exist already, it is generated automatically for you.
        
        _side - Side
            The side which this configuration applies to.  Multiple sides per command are not supported.
            
        _groupName - String OR Array of Strings
            The name of the group that this configuration applies to.  If multiple group names are provided, the configuration applies to all of them.

        _role - String OR Array of Strings
            The Gearscript role-name that this configuration applies to.  If multiple role names are provided, the configuration applies to all of them.

    COMMAND REFERENCE:

        Summary:
            f_fnc_acre_giveRadioToAllUnits
            f_fnc_acre_giveRadioToAllInGroup
            f_fnc_acre_giveRadioToAllInRole
            f_fnc_acre_giveRadioToRoleInGroup
            f_fnc_acre_removeRadioFromAllInRole
            f_fnc_acre_removeRadioFromAllInGroup

        f_fnc_acre_giveRadioToAllUnits
            Gives a radio tuned to the given channel to every unit on the given side.
            Args:
                ["_radio", "_channelName", "_side"]
            Example:
                // Gives a Baofeng radio to all BLUFOR, tuned to the "ALL BLUFOR" net.
                ["ACRE_BF888S", "ALL BLUFOR", west] call f_fnc_acre_giveRadioToAllUnits;

        f_fnc_acre_giveRadioToAllInGroup
            Gives a radio to every unit in the given group and side.
            Args:
                ["_radio", "_channelName", "_side", "_groupName"]
            Example:
                // Gives a short-range radio to all members of BLUFOR ALPHA, tuned to "ALPHA SR" net.
                ["ACRE_PRC343", "ALPHA SR", west, "ALPHA"] call f_fnc_acre_giveRadioToAllInGroup;

        f_fnc_acre_giveRadioToAllInRole
            Gives a radio to every unit with the given role on the given side.
            Args:
                ["_radio", "_channelName", "_side", "_role"]
            Example:
                // Gives a SEM-52 long-range radio to all BLUFOR SLs, FTLs, Medics and the CO, tuned to "GROUND CMD".
                ["ACRE_SEM52SL", "GROUND CMD", west, ["sl", "ftl", "co", "med"]] call f_fnc_acre_giveRadioToAllInRole;

        f_fnc_acre_giveRadioToRoleInGroup
            Gives a radio to specific role(s) in specific group(s).
            Args:
                ["_radio", "_channelName", "_side", "_role", "_groupName"];
            Example:
                // Gives short-range radios only to riflemen in the BLUFOR SPECOPS group, tuned to "COOL NET"
                ["ACRE_PRC343", "COOL NET", west, "rif", "SPECOPS"] call f_fnc_acre_giveRadioToAllInGroup;

        f_fnc_acre_removeRadioFromAllInRole
            Takes away a radio from every unit with the given role on the given side.
            Useful when 'f_fnc_acre_giveRadioToAllUnits' has been used, but there's one exception that should not have the radio.
            Args:
                ["_radio", "_channelName", "_side", "_role"]
            Example:
                // Removes a SEM-52 long-range radio from all BLUFOR FTLs, which was tuned to "GROUND CMD".
                ["ACRE_SEM52SL", "GROUND CMD", west, "ftl"] call f_fnc_acre_giveRadioToAllInRole;

        f_fnc_acre_removeRadioFromAllInGroup
            Takes away a radio from every unit in the given group and side.
            Useful when 'f_fnc_acre_giveRadioToAllUnits' has been used, but there's one exception that should not have the radio.
            Args:
                ["_radio", "_channelName", "_side", "_groupName"]
            Example:
                // Removes a short-range radio from all members of BLUFOR ALPHA, which was tuned to "ALPHA SR" net.
                ["ACRE_PRC343", "ALPHA SR", west, "ALPHA"] call f_fnc_acre_removeRadioFromAllInGroup;

        f_fnc_acre_removeRadioFromRoleInGroup
            Takes away a radio from specific role(s) in specific group(s).
            Useful when 'f_fnc_acre_giveRadioToAllInGroup' or 'f_fnc_acre_giveRadioToAllInRole' has been used, but there's one exception that should not have the radio.
            Args:
                ["_radio", "_channelName", "_side", "_role", "_groupName"];
            Example:
                // Removes a short-range radio from an extremely suspicious individual in the BLUFOR ALPHA group, which was tuned to "ALPHA SR" net.
                ["ACRE_PRC343", "ALPHA SR", west, "sus", "ALPHA"] call f_fnc_acre_giveRadioToAllInGroup;


*/

// RADIO STRUCTURE

// REMEMBER - IN ACRE, an ItemRadio will be automatically turned into an ACRE_PRC343!
f_var_acre_standardSHRadio = "ACRE_PRC343";  // Standard Short-range
f_var_acre_standardLRRadio = "ACRE_PRC152";  // Standard Long-range
f_var_acre_extraLRRadio    = "ACRE_PRC148";  // Additional LR radio
f_var_acre_backpackRadio   = "ACRE_PRC117F"; // Backpack Radio


// Defines the radio net each side uses.
// If you want some sides to share nets, match the nets.
f_var_acre_bluforRadioNet   = "BLU NET";
f_var_acre_opforRadioNet    = "OPF NET";
f_var_acre_indforRadioNet   = "IND NET";
f_var_acre_civilianRadioNet = "CIV NET";


// Define your radio structure here - see the comment at the top of the file for example usage.
// The default configuration below shows a BLUFOR radio net for a small infantry mission, including a FAC (but no pilot - try adding one!).
[f_var_acre_standardSHRadio, "ALPHA SR", west, "ALPHA"] call f_fnc_acre_giveRadioToAllInGroup;
[f_var_acre_standardSHRadio, "BRAVO SR", west, "BRAVO"] call f_fnc_acre_giveRadioToAllInGroup;
[f_var_acre_standardSHRadio, "CHARLIE SR", west, "CHARLIE"] call f_fnc_acre_giveRadioToAllInGroup;
[f_var_acre_standardSHRadio, "COMMAND SR", west, "COMMAND"] call f_fnc_acre_giveRadioToAllInGroup;

[f_var_acre_standardLRRadio, "GROUND CMD", west, ["sl", "ftl", "co", "med"]] call f_fnc_acre_giveRadioToAllInRole;

[f_var_acre_backpackRadio, "AIR CMD", west, "fac"] call f_fnc_acre_giveRadioToAllInRole;


// ====================================================================================
// BABEL API

// Defines the languages that exist in the mission.
// String id, String display-name.
f_arr_acre_languageMap =
[
    ["blu", "Friendlese"],
    ["ind", "Foreignese"],
    ["opf", "Enemese"],
    ["civ", "Civilish"]
];


// Defines the language(s) that players on each side can speak.
// Needs to match the String id above.  Can use more than one language per side.
f_arr_acre_languages_blufor = ["blu"];
f_arr_acre_languages_opfor = ["ind"];
f_arr_acre_languages_indfor = ["opf"];
f_arr_acre_languages_civilian = ["civ"];