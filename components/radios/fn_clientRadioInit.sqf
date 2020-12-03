#include "macros.hpp"

// F3 - ACRE Clientside Initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// Set up the radio presets according to side.

params ["_unit"];

// Pre-run stuff, ensure only one run occurs at a time and only after radio config is done.
RUN_LOCAL_TO(_unit,f_fnc_clientRadioInit,_this);
RUN_AS_ASYNC(f_fnc_clientRadioInit);

if (f_radios_settings_acre2_disableRadios) exitWith {};

if (_unit getVariable ["f_var_running_radios", false]) exitWith {};
_unit setVariable ["f_var_running_radios", true];

WAIT_UNTIL_MISSION_STARTED;
waitUntil { IS_TRUE(f_radios_ready) };
waitUntil { alive _unit };


// Magic number don't worry about it :)
_typeOfUnit = "f£$%dsjkl34%$%^werGjsf";

// The radio config can take a second or two - if the loadout changes during this then we need to rerun.
while {!(_typeOfUnit isEqualTo (_unit getVariable ["f_var_assignGear", "NIL"]))} do
{
	_typeOfUnit = _unit getVariable ["f_var_assignGear", "NIL"];

	// The meat of the radio config is in here.
	[_unit] call f_fnc_performClientRadioInit;
};


_unit setVariable ["f_var_running_radios", false];
