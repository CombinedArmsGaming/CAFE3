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
f_radios_settings_acre2_shortRange = [];

// Set the list of units that get a long range
f_radios_settings_acre2_longRange = [];

// Unit types you want to give an extra long-range radio
// E.G: ["co", "m"] would give the CO and all medics an extra long-range radios
f_radios_settings_acre2_extraRadios = ["sl", "ftl", "crew", "zeus", "co", "med"];

// Unit types you want to give a backpack radio
// This backpack radio still uses the Long Range radio channel definitions below.
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
    ["ind", "Debugese"],
    ["opf", "Vietnamese"]
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
f_radios_settings_acre2_sr_groups_blufor =
[
];

f_radios_settings_acre2_sr_groups_opfor = f_radios_settings_acre2_sr_groups_blufor;
f_radios_settings_acre2_sr_groups_indfor = f_radios_settings_acre2_sr_groups_blufor;

f_radios_settings_acre2_lr_groups_blufor =
[
    ["GROUND",    ["ALPHA", "BRAVO", "COMMAND"]],
	["SUPPORT",    ["CASTER", "FALCON", "HAWK", "COMMAND", "ZEUS"]]
];

f_radios_settings_acre2_lr_groups_opfor = f_radios_settings_acre2_lr_groups_blufor;
f_radios_settings_acre2_lr_groups_indfor = f_radios_settings_acre2_lr_groups_blufor;

// ====================================================================================
// MISC ACRE2 settings, these are all set the ACRE2 defaults

// Used by other componets to determine when all radio settings have been populated.
f_radios_loadedSettings = true;
