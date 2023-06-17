if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
    f_map_radioAssignments = createHashMap;
    f_map_radioChannels = createHashMap;
    f_map_languageAssignments = createHashMap;

    [] call f_fnc_acre_configureRadioTypes;

    private ["_shortRadio", "_longRadio", "_extraLongRadio", "_backpackRadio"];
    private ["_languageMap"];
    private ["_bluforLanguage", "_opforLanguage", "_indforLanguage", "_civLanguage"];

    #include "..\..\..\configuration\acre_radio_configuration.sqf"

    f_arr_acre_languageMap = _languageMap;

    f_arr_acre_languages_blufor = _bluforLanguage;
    f_arr_acre_languages_opfor = _opforLanguage;
    f_arr_acre_languages_indfor = _indforLanguage;
    f_arr_acre_languages_civ = _civLanguage;

    [] call f_fnc_acre_initialiseRadioPresets;
    [] call f_fnc_acre_initialiseLanguages;

};

f_radios_loadedSettings = true;