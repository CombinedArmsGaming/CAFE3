// F3 - ACRE2 Settings
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// RADIO STRUCTURE

// Whether any radios should be assigned at all, to any units
// TRUE = Disable radios for all units
f_radios_settings_acre2_disableRadios = FALSE;

// Whether or not the radio frequencies should be left as default, and not split per side
// TRUE = Disable frequency seperation across sides
f_radios_settings_acre2_disableFrequencySplit = FALSE;

// Set a list of units that get a short wave
// if its nil, that means all units get a radio
// empty array means that noone gets
f_radios_settings_acre2_shortRange = nil;

// Set the list of units that get a long range
f_radios_settings_acre2_longRange = ["ftl", "med", "sl"];

// Unit types you want to give an extra long-range radio
// E.G: ["co", "m"] would give the CO and all medics an extra long-range radios
f_radios_settings_acre2_extraRadios = ["sl", "crew", "zeus", "co"];

// Unit types you want to give a backpack radio
// This backpack radio uses the Extra Long Range radio channel definitions below.
f_radios_settings_acre2_BackpackRadios = [];

// Standard Short
f_radios_settings_acre2_standardSHRadio = "ACRE_PRC343";
// Standard LongRange
f_radios_settings_acre2_standardLRRadio = "ACRE_PRC152";
// Extra LR radio
f_radios_settings_acre2_extraRadio = "ACRE_PRC148";
// Backpack Radio
f_radios_settings_acre2_BackpackRadio = "ACRE_PRC117F";

// ====================================================================================
// BABEL API

// Defines the languages that exist in the mission.
// string id, displayname
f_radios_settings_acre2_languages =
[
    ["blu", "English"],
    ["ind", "Foreignese"],
    ["opf", "Enemese"]
];

// defines the language that a player can speak.
// can define multiple
f_radios_settings_acre2_language_blufor = ["blu"];
f_radios_settings_acre2_language_opfor = ["ind"];
f_radios_settings_acre2_language_indfor = ["opf"];

// Channel names and group defaults
// first item in the array will correspond to the first channel
// item definition: ["CHANNEL NAME", ["GROUP1 NAME", "GROUP2 NAME"]]
// note that if using a 343 only the first 16 channels are available for the short-range array
// also note these only work if f_radios_settings_acre2_disableFrequencySplit is set to false

// Short-range channels.
// These are normally used for communication within a team or group.
// Examples: A1 net composed of FTL, Riflemen, Medic etc.  Partisan/guerrilla comms for localised coordination.
f_radios_settings_acre2_sr_groups_blufor =
[
    ["ALPHA",    ["ALPHA"]],
    ["BRAVO",    ["BRAVO"]],
    ["CHARLIE",    ["CHARLIE"]],
    ["COMMAND",    ["COMMAND"]]
];

f_radios_settings_acre2_sr_groups_opfor = f_radios_settings_acre2_sr_groups_blufor;
f_radios_settings_acre2_sr_groups_indfor = f_radios_settings_acre2_sr_groups_blufor;

// Long-range channels.
// These are shared with extra-long-range (XLR) radios and backpack radios.
// Duplicate these channels in the XLR list, but only assign members here for long-range radios.
// These channels are normally used for squad-level communication.
// Examples: Alpha net composed of ASL, A1, A2.  Section net composed of ASL, A2IC, AMED.  Mechanised team composed of ASL, A-Vic.
f_radios_settings_acre2_lr_groups_blufor =
[
    ["GROUND CMD",    []],
    ["ALPHA NET",    ["ALPHA"]],
    ["BRAVO NET",    ["BRAVO"]],
    ["CHARLIE NET",    ["CHARLIE"]],
    ["HOTLINE ZEUS",    ["ZEUS"]]
];

f_radios_settings_acre2_lr_groups_opfor = f_radios_settings_acre2_lr_groups_blufor;
f_radios_settings_acre2_lr_groups_indfor = f_radios_settings_acre2_lr_groups_blufor;

// Extra-long-range channels.
// These are shared with long-range (LR) radios and backpack radios.
// Duplicate these channels in the LR list, but only assign members here for extra-long-range radios.
// These channels are normally used for platoon-level communication or higher.
// Examples: Ground command net composed of CO, ASL, BSL, CSL.  Vehicle net composed of XO/VC, A-Vic, B-Vic, CAS.  Liason net composed of CO, INDFOR CO.
f_radios_settings_acre2_xlr_groups_blufor =
[
    ["GROUND CMD",    ["ALPHA", "BRAVO", "CHARLIE", "COMMAND", "ZEUS"]],
    ["ALPHA NET",    []],
    ["BRAVO NET",    []],
    ["CHARLIE NET",    []],
    ["HOTLINE ZEUS",    []]
];

f_radios_settings_acre2_xlr_groups_opfor = f_radios_settings_acre2_xlr_groups_blufor;
f_radios_settings_acre2_xlr_groups_indfor = f_radios_settings_acre2_xlr_groups_blufor;

// ====================================================================================
// MISC ACRE2 settings, these are all set the ACRE2 defaults

// Used by other components to determine when all radio settings have been populated.
f_radios_loadedSettings = true;
