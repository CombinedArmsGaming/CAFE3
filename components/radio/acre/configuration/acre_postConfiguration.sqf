f_arr_acre_languageMap = _languageMap;

f_arr_acre_languages_blufor = _bluforLanguage;
f_arr_acre_languages_opfor = _opforLanguage;
f_arr_acre_languages_indfor = _indforLanguage;
f_arr_acre_languages_civ = _civLanguage;

[] call f_fnc_acre_initialiseRadioPresets;
[] call f_fnc_acre_initialiseLanguages;

f_radios_loadedSettings = true;
