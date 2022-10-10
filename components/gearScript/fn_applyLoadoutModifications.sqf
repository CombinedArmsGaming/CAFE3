#include "macros.hpp"

// This file is for taking a unit gearscript definition and manipulating its contents before it is finalized.

params ["_loadout"];

if (count _loadout < 3) then //hotfix to check if the gearstring is the new version, converting it into the old workable version
{
	_loadout = _loadout#0;
};

_uniform = _loadout#3;
_vest = _loadout#4;
_backpack = _loadout#5;

[_uniform] call f_fnc_searchAndDestroyRadios;
[_vest] call f_fnc_searchAndDestroyRadios;
[_backpack] call f_fnc_searchAndDestroyRadios;

[_loadout] call f_fnc_removeRadioFromItems;

_loadout
