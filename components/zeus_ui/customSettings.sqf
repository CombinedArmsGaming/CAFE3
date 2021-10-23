#include "macros.hpp"

private _script =
{
	params [["_state", false]];

	if (!(_state)) exitWith {
		DEBUG_PRINT_LOG("[Joe-brand Zeus rework] Mission-maker chose old Zeus behaviour");
		[]call f_fnc_initializeOldZeusBehaviour;
	};

	DEBUG_PRINT_LOG("[Joe-brand Zeus rework] Mission-maker chose new Zeus behaviour, initializing ACRE script");

	[]call f_fnc_addZeusAcreActions;
};


[
	"CA2_ZeusRework_OptIn",
	"CHECKBOX",
	[
		"Activate Zeus rework",
		"Activate the reworked Zeus mode.\nYour physical player unit will not be glued to the camera.\n\nYou can switch your speaking source in Zeus with ACE Interact.\n"
	],
	[
		CATEGORY_NAME,
		"Zeus Rework"
	],
	false,
	1,
	_script,
	true

] call CBA_fnc_addSetting;