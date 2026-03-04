#include "macros.hpp"

/*
    Populates the loadouts list
*/

disableSerialization;

params ["_loadoutsList"];

waitUntil { IS_TRUE(f_var_gearscript_loaded) };
// faction player is correct even when dead
private _faction = toLower (faction player);
private _gearVariant = [_faction] call f_fnc_factionToSideName;
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

