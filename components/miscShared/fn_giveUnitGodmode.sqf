#include "macros.hpp"

/*
	fn_giveUnitGodmode
		By Bubbus

	Attempt to give godmode to a unit.  May fail to certain scenarios, does not prevent forced death via setDamage.

	Args:
		_unit (Object, Local)
		Unit to give godmode to.

		_keepHealthy (Boolean)
		Choose whether to apply a "keep-healthy" loop to the unit.  Helps protect against forced damage.

	Effect: Global

*/

params [
	["_unit", objNull, [objNull]],
	["_keepHealthy", false, [false]]
];

LOCAL_ONLY(_unit);

[_unit, false] remoteExecCall ["allowDamage", 0, true];
_unit setVariable ["ace_medical_allowDamage", false, true];

// Prevent running multiple instances of the "keep-healthy" loop
if (isNil "handle_fnc_keepUnitHealthy") then {handle_fnc_keepUnitHealthy = scriptNull};
terminate handle_fnc_keepUnitHealthy;

if (_keepHealthy) then {
	handle_fnc_keepUnitHealthy = [_unit] spawn f_fnc_keepUnitHealthy;
};
