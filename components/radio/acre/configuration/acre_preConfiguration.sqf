f_map_radioAssignments = createHashMap;
f_map_radioChannels = createHashMap;
f_map_languageAssignments = createHashMap;

[] call f_fnc_acre_configureRadioTypes;

private ["_shortRadio", "_longRadio", "_extraLongRadio", "_backpackRadio"];
private ["_languageMap"];
private ["_bluforLanguage", "_opforLanguage", "_indforLanguage", "_civLanguage"];