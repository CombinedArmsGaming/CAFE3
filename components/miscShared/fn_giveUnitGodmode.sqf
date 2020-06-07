//	Zeus extensions for CA, by Bubbus.
//
//  Gives godmode to the passed unit.
//  NOTE: Godmode is not 100% effective and will fail to things like artillery, ACE backblast etc.
//  These kinds of damage ignore whether they should do damage, and just deal the damage anyway.
//
//  PARAMETERS:
//
//		_unit
//			The unit to give godmode to.
//

#include "macros.hpp"

params ["_unit"];

LOCAL_ONLY(_unit);

[_unit, false] remoteExec ["allowDamage", 0, true];
_unit setVariable ["ace_medical_allowDamage", false, true];

[_unit, ["HandleDamage", {false}]] remoteExec ["addEventHandler", 0, true];


if (isPlayer _unit) then
{
	[_unit] spawn
	{
		params ["_unit"];

		while {(!(isNull _unit)) and {alive _unit}} do
		{
			[_unit] call ace_medical_treatment_fnc_fullHealLocal;
			[_unit, false] call ace_medical_fnc_setUnconscious;
			sleep 1;
		};

	};

};
