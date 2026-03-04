/* --------------------------------------------------------------------------------------------------------------------
	Author:	 Cre8or
	Description:
		(Re)applies the identities on all existing AI units.
		Called once upon mission initialisation / JIP.
	Arguments:
		(none)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "macros.hpp";





// Set up some variables
private ["_identity"];





// Iterate over all existing units
{
	_identity = _x getVariable ["f_var_identity", ""];

	if (_identity != "") then {
		[_x, _identity] call f_fnc_applyIdentity;
	};

} forEach (
	allDeadMen +
	(allUnits select {
		!isPlayer _x
	})
);
