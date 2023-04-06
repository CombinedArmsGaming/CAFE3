f_map_radioAssignments = createHashMap;
f_map_radioChannels = createHashMap;

[] call f_fnc_acre_configureRadioTypes;

private ["_shortRadio", "_longRadio", "_extraLongRadio", "_backpackRadio"];
private ["_bluforRadioNet", "_opforRadioNet", "_indforRadioNet", "_civRadioNet"];
private ["_languageMap"];
private ["_bluforLanguage", "_opforLanguage", "_indforLanguage", "_civLanguage"];