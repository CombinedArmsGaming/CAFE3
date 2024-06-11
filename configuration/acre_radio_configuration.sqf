/*
    ACRE2 Settings File

    Use this file to set up a radio net for your mission.  All sides can be configured differently, and all ACRE radios can be used.

    RADIO NAMES REFERENCE:

        The following radios will be added to the unit's vest or uniform:
            "ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC148", "ACRE_BF888S", "ACRE_SEM52SL"
        
        The following radios will be added to the unit's backpack (if the unit has no backpack, one will be given):
            "ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70"

    RADIO COMMAND ARGUMENTS REFERENCE:

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

    RADIO COMMAND REFERENCE:

        Summary:
            f_fnc_acre_giveRadioToAllUnits
            f_fnc_acre_giveRadioToAllInGroup
            f_fnc_acre_giveRadioToAllInRole
            f_fnc_acre_giveRadioToRoleInGroup
            f_fnc_acre_removeRadioFromAllInRole
            f_fnc_acre_removeRadioFromAllInGroup
            f_fnc_acre_removeRadioFromRoleInGroup

        These commands can be used in any order - the proper behaviour is figured out by the framework.

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

    LANGUAGE COMMAND ARGUMENTS REFERENCE:

        _languages - String OR Array of Strings
            Name of the language(s) to give to the units.  The languages must exist in the '_languageMap'.
        
        _side - Side
            The side which this configuration applies to.  Multiple sides per command are not supported.
            
        _groupName - String OR Array of Strings
            The name of the group that this configuration applies to.  If multiple group names are provided, the configuration applies to all of them.

        _role - String OR Array of Strings
            The Gearscript role-name that this configuration applies to.  If multiple role names are provided, the configuration applies to all of them.

    LANGUAGE COMMANDS:

        Summary:
            f_fnc_acre_giveLanguagesToAllInGroup
            f_fnc_acre_giveLanguagesToAllInRole
            f_fnc_acre_giveLanguagesToRoleInGroup
            f_fnc_acre_removeLanguagesFromAllInGroup
            f_fnc_acre_removeLanguagesFromAllInRole
            f_fnc_acre_removeLanguagesFromRoleInGroup
        
        These commands can be used in any order - the proper behaviour is figured out by the framework.
        The default language for each side can be changed via the '_bluforLanguage' etc. lines at the bottom of the file.

        f_fnc_acre_giveLanguagesToAllInGroup
            Gives the language(s) to all units in the given group(s).
            Args:
                ["_languages", "_side", "_groupName"]
            Example:
                // On the INDFOR side, gives all members of the "ADVISORS" group the BLUFOR language.
                // Because they are an INDFOR group, they will already have the INDFOR language, so they will speak both.
                ["blu", independent, "ADVISORS"] call f_fnc_acre_giveLanguagesToAllInGroup;

        f_fnc_acre_giveLanguagesToAllInRole
            Gives the language(s) to all units with the given role(s).
            Args:
                ["_languages", "_side", "_role"]
            Example:
                // On the BLUFOR side, gives all interpreters the Civilian language.
                // Because they are BLUFOR units, they will already have the BLUFOR language, so they will speak both.
                ["civ", west, "interpreter"] call f_fnc_acre_giveLanguagesToAllInRole;

        f_fnc_acre_giveLanguagesToRoleInGroup
            Gives the language(s) to the role(s) in the given group(s).
            Args:
                ["_languages", "_side", "_role", "_groupName"]
            Example:
                // On the BLUFOR side, gives a very suspicious rifleman in CHARLIE the OPFOR language.  Do the same for the CHARLIE FTL.
                // Because they are BLUFOR units, they will already have the BLUFOR language, so they will speak both.
                ["opf", west, ["rif", "ftl"], "CHARLIE"] call f_fnc_acre_giveRadioToAllUnits;

        f_fnc_acre_removeLanguagesFromAllInGroup
            Removes the language(s) from all units in the given group(s).
            Args:
                ["_languages", "_side", "_groupName"]
            Example:
                // On the BLUFOR side, removes the BLUFOR language from all members of the "LOCALS" group, then gives them the INDFOR language.
                // Because they are a BLUFOR group, they automatically have the BLUFOR language.  The BLUFOR language needs to be removed so they can speak only INDFOR language.
                ["blu", west, "LOCALS"] call f_fnc_acre_removeLanguagesFromAllInGroup;
                ["ind", west, "LOCALS"] call f_fnc_acre_giveLanguagesToAllInGroup;

        f_fnc_acre_removeLanguagesFromAllInRole
            Removes the language(s) from all units with the given role(s).
            Args:
                ["_languages", "_side", "_role"]
            Example:
                // On the BLUFOR side, removes the BLUFOR language from the "VIP" role, then gives them the Civilian language.
                // Because they are a BLUFOR unit, they automatically have the BLUFOR language.  The BLUFOR language needs to be removed so they can speak only INDFOR language.
                ["blu", west, "vip"] call f_fnc_acre_removeLanguagesFromAllInRole;
                ["civ", west, "vip"] call f_fnc_acre_giveLanguagesToAllInRole;

        f_fnc_acre_removeLanguagesFromRoleInGroup
            Removes the language(s) from the role(s) in the given group(s).
            Args:
                ["_languages", "_side", "_role", "_groupName"]
            Example:
                // On the BLUFOR side, removes the BLUFOR language from the "VIP" role in the "COMMAND" group, then gives them and the "interpreter" the Civilian language.
                // Because they are a BLUFOR unit, they automatically have the BLUFOR language.  The BLUFOR language needs to be removed so they can speak only INDFOR language.
                ["blu", west, "vip", "COMMAND"] call f_fnc_acre_removeLanguagesFromRoleInGroup;
                ["civ", west, ["vip", "interpreter"], "COMMAND"] call f_fnc_acre_giveLanguagesToAllInRole;

*/

// RADIO STRUCTURE

// REMEMBER - IN ACRE, an ItemRadio (the vanilla A3 radio) will be automatically turned into an ACRE_PRC343!
_shortRadio     = "ACRE_PRC343";  // Standard Short-range
_longRadio      = "ACRE_PRC152";  // Standard Long-range
_extraLongRadio = "ACRE_PRC148";  // Additional LR radio
_backpackRadio  = "ACRE_PRC117F"; // Backpack Radio


// Defines the radio net each side uses.
// If you want some sides to share nets, match the nets.
f_var_acre_bluforRadioNet = "BLU NET";
f_var_acre_opforRadioNet  = "OPF NET";
f_var_acre_indforRadioNet = "IND NET";
f_var_acre_civRadioNet    = "CIV NET";


// Define your radio structure here - see the comment at the top of the file for example usage.
// The default configuration below shows a BLUFOR radio net for a small infantry mission, including a FAC (but no pilot - try adding one!).

// BLUFOR
[_shortRadio, "ALPHA SR", west, "ALPHA"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "BRAVO SR", west, "BRAVO"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "CHARLIE SR", west, "CHARLIE"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "COMMAND SR", west, "COMMAND"] call f_fnc_acre_giveRadioToAllInGroup;

[_longRadio, "GROUND CMD", west, ["sl", "ftl", "co", "med", "fac"]] call f_fnc_acre_giveRadioToAllInRole;

[_backpackRadio, "AIR CMD", west, ["fac", "zeus"]] call f_fnc_acre_giveRadioToAllInRole;

[_backpackRadio, "GROUND CMD", west, "zeus"] call f_fnc_acre_giveRadioToAllInRole;
[_shortRadio, "COMMAND SR", west, "zeus"] call f_fnc_acre_giveRadioToAllInRole;

// INDFOR
[_shortRadio, "INDIA-1 SR", resistance, "INDIA-1"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "INDIA-2 SR", resistance, "INDIA-2"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "INDIA-3 SR", resistance, "INDIA-3"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "INDIA SR", resistance, "INDIA"] call f_fnc_acre_giveRadioToAllInGroup;

[_longRadio, "IND GROUND CMD", resistance, ["sl", "ftl", "co", "med", "fac"]] call f_fnc_acre_giveRadioToAllInRole;

[_backpackRadio, "IND AIR CMD", resistance, ["fac"]] call f_fnc_acre_giveRadioToAllInRole;

// OPFOR
[_shortRadio, "TANGO-1 SR", east, "TANGO-1"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "TANGO-2 SR", east, "TANGO-2"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "TANGO-3 SR", east, "TANGO-3"] call f_fnc_acre_giveRadioToAllInGroup;
[_shortRadio, "TANGO SR", east, "TANGO"] call f_fnc_acre_giveRadioToAllInGroup;

[_longRadio, "OPF GROUND CMD", east, ["sl", "ftl", "co", "med", "fac"]] call f_fnc_acre_giveRadioToAllInRole;

[_backpackRadio, "OPF AIR CMD", east, ["fac"]] call f_fnc_acre_giveRadioToAllInRole;


// ====================================================================================
// BABEL API

// Defines the languages that exist in the mission.
// [ID, Display-name]
_languageMap =
[
    ["blu", "Friendlese"],
    ["ind", "Foreignese"],
    ["opf", "Enemese"],
    ["civ", "Civilish"],
    ["huh", "Some secret 5th language that nobody speaks"]
];


// Defines the language(s) that players on each side can speak.
// Needs to match one of the IDs above.  Can use more than one language per side.
_bluforLanguage = ["blu"];
_opforLanguage  = ["opf"];
_indforLanguage = ["ind"];
_civLanguage    = ["civ"];