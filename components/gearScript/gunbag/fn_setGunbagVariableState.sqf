#include "macros.hpp"

// Used by gearscript to set the state of a unit's gunbag global variable.
// Should a string representing the weapon's CfgWeapons classname.

params ["_faction", "_unitName", ["_contents", nil, [""]]];

if (isNil "_contents") throw "_contents must not be nil.";

private _weaponState = [_contents] call f_fnc_getWeaponStateFromClassName;

SET_GUNBAG_CONTENTS(_faction,_unitName,_weaponState);