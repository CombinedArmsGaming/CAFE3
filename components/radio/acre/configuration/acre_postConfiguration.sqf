diag_log "[RADIOS-2]: acre_postConfig";

[] call f_fnc_acre_initialiseRadioPresets;
[] call f_fnc_acre_initialiseLanguages;

f_radios_loadedSettings = true;
