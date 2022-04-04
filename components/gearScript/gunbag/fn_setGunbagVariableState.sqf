#include "macros.hpp"

// Used by gearscript to set the state of a unit's gunbag global variable.
// Can be an array in ACE "getWeaponState" format, or a string representing the weapon's CfgWeapons classname.

params ["_faction", "_unitName", ["_contents", nil, ["", []]]];

if (isNil "_contents") throw "_contents must not be nil.";

if (typeName _contents == "STRING") then
{
	_contents = [_contents] call f_fnc_getWeaponStateFromClassName;
};

if (typeName _contents == "ARRAY") then
{
	private _isValid = _contents params [["_attachments", nil, [[]], 4], ["_muzzles", nil, [[]]], ["_magazines", nil, [[]]], ["_ammo", nil, [[]]]];

	if !(_isValid) throw format ["Gunbag array for unit type %1 was not valid (side %2).", _unitName, _faction];
}
else
{
	throw format ["_contents should be an ARRAY but is instead a %1", typeName _contents];
};

SET_GUNBAG_CONTENTS_DIRECT(_faction,_unitName,_contents);