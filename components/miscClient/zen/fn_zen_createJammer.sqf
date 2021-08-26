/*
	Created By: Gibbs
*/
#include "../macros.hpp"

CLIENT_ONLY;

params ["_object"];

if (isNull _object) then
{
    ["No object selected."] call zen_common_fnc_showMessage;
}
else
{
	["Create Jammer",
	[
		["COMBO", "Jammer Type", [[0, 1, 2, 3, 4, 5, 6], ["All Types", "Radio", "Phones (ACE)", "Detonators (Clackers)", "Drones", "GPS", "Radar"], 0]],
		["SLIDER", "Jammer Range", [1, 30000, 2000, 0]]
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_jammerType", "_jammerRange"];
		_args params ["_object"];
		[_object, _jammerType, _jammerRange] remoteExec ["f_fnc_addJammerToObject", 2];
	    ["Adding jammer to '%1'.", _object] call zen_common_fnc_showMessage;
	},
	{},
	[_object]] call zen_dialog_fnc_create;
};
