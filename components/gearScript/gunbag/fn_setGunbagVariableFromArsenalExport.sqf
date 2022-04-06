#include "macros.hpp"

// Used by gearscript to set the state of a unit's gunbag global variable.
// Provide an ACE Arsenal export array ("Unit Loadout Array"), or a string representing the weapon's CfgWeapons classname.

params ["_faction", "_unitName", ["_contents", nil, [[], ""]]];

if (isNil "_contents") then {throw format ["_contents for gunbag contents must not be nil. (unit %1, side %2).", _unitName, _faction]};

if (typeName _contents isEqualTo "STRING") exitWith
{
	[_faction, _unitName, _contents] call f_fnc_setGunbagVariableState;
};

if (count _contents < 1) then {throw format ["_contents for gunbag contents is empty. (unit %1, side %2).", _unitName, _faction]};

private _rifle = _contents # 0;

private _isRifleWellFormed = _rifle params 
[
	["_rifleClass", nil, [""]], 
	["_muzzleDevice", nil, [""]],
	["_sideRailDevice", nil, [""]],
	["_optic", nil, [""]], 
	["_muzzle1Mag", nil, [[]]], 
	["_muzzle2Mag", nil, [[]]], 
	["_bipod", nil, [""]]
];

if !(_isRifleWellFormed) then {throw format ["_contents for gunbag contents contained an invalid rifle.  Please re-export the loadout. (unit %1, side %2).", _unitName, _faction]};

private _magsArray = [_muzzle1Mag, _muzzle2Mag] select {_x isNotEqualTo []};

private _contents = 
[
	[_muzzleDevice, _sideRailDevice, _optic, _bipod], 
	_rifleClass call ace_common_fnc_getWeaponMuzzles,
	_magsArray apply {_x # 0}, 
	_magsArray apply {_x # 1},
	_rifleClass
];

SET_GUNBAG_CONTENTS(_faction,_unitName,_contents);