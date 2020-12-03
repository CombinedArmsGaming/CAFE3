#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_performClientRadioInit);

params ["_unit"];


// At minimum, set radio presets to setup faction split etc.
[_unit] call f_fnc_clientSetRadioPresets;

DEBUG_PRINT_LOG("[Radios] Removing radios from unit.")
[] call f_fnc_removeRadios;


// Depending on the loadout used in the assignGear component, each unit is assigned a set of radios.
_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];
DEBUG_FORMAT1_LOG("[Radios] Unit type is: %1",_typeOfUnit)

if (_typeOfUnit != "NIL") then
{
	[_unit] call f_fnc_tryGiveShortRangeRadio;
	[_unit] call f_fnc_tryGiveLongRangeRadio;
	[_unit] call f_fnc_tryGiveExtraLongRangeRadio;
	[_unit] call f_fnc_tryGiveBackpackRadio;

};

// Config spawned radios for player group.
[_unit] spawn f_fnc_setupRadioChannels;
