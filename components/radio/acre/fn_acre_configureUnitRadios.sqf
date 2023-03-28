#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus

params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

if !(isPlayer _unit) exitWith {};

if !([] call acre_api_fnc_isInitialized) exitWith
{
	[
		{
			[] call acre_api_fnc_isInitialized
		},
		f_fnc_acre_configureUnitRadios,
		_this
	] call CBA_fnc_waitUntilAndExecute;
};

DEBUG_FORMAT1_LOG("[RADIO-2] Configuring ACRE for player '%1'.",_unit)

_this call f_fnc_acre_configureUnitLanguages;
//private _radioConfig = _this call f_fnc_acre_getRadioConfigForUnit;
//[_unit] call f_fnc_acre_copyGroupRadioChannelsToUnit;
//_this call f_fnc_acre_applyUnitRadioOverrides;