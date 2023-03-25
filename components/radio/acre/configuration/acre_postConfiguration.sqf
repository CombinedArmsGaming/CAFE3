[] call f_fnc_initialiseRadioPresets;

{
    _x call acre_api_fnc_babelAddLanguageType;
} foreach f_arr_acre_languageMap;

f_radios_loadedSettings = true;
