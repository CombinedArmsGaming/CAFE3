#include "macros.hpp"

/*
    Populates the loadouts list
*/

disableSerialization;

// Faction default is assignGear_Faction, or the player's faction if they don't have that var
params ["_loadoutsList", ["_faction", toLower (player getVariable ["f_var_assignGear_Faction", faction player])]];

_loadoutsList setVariable ["f_var_faction", _faction];

waitUntil { IS_TRUE(f_var_gearscript_loaded) };
private _gearVariant = [toLower _faction] call f_fnc_factionToSideName;
private _typeOfUnit = player getVariable ["f_var_assignGear", ""];
private _registry = LOADOUT_REGISTRY_DYNAMIC(_gearVariant);

if (_registry isEqualTo []) exitWith {};

{
    private _xCaps = toUpper _x;

    if (_xCaps isEqualTo "DEFAULT") exitWith {};
    if (_xCaps isEqualTo "ZEUS" and (!(player getVariable ['f_var_isZeus', false]))) exitWith {};

    private _listIdx = _loadoutsList lbAdd _xCaps;
    // Store the original name of the loadout
    _loadoutsList lbSetData [_listIdx, _x];
    if (_xCaps isEqualTo (toUpper _typeOfUnit)) then {
        _loadoutsList lbSetCurSel _listIdx;
    };
} forEach _registry;

