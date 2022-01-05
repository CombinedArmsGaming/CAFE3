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

params ["_unit", ["_keepHealthy", false]];

LOCAL_ONLY(_unit);

[_unit, false] remoteExec ["allowDamage", 0, true];
_unit setVariable ["ace_medical_allowDamage", false, true];

if (_keepHealthy) then
{
	[_unit] spawn f_fnc_keepUnitHealthy;
};
