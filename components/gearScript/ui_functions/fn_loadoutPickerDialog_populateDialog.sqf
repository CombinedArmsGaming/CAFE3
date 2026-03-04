#include "macros.hpp"

disableSerialization;

params ["_display"];

private _roleText = _display displayCtrl IDC_CURRENTLOADOUT_TEXT;
private _currentRole = player getVariable ["f_var_assignGear", "UNKNOWN"];
_groupText ctrlSetText (format ["Your current loadout is:\n%1", _currentRole]);

private _loadoutsList = _display displayCtrl IDC_LOADOUTSLIST;

// Make sure gear is populated
[_loadoutsList, lbCurSel _loadoutsList] call f_fnc_loadoutsList_onLBSelChanged;