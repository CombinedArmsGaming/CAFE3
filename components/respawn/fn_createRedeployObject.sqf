#include "macros.hpp"

params [["_object", nil, [objNull]], ["_target", missionNamespace], ["_respawnName", "", [""]], ["_condition", "true", [""]]];

if (isNull _object) exitWith {};

if (isServer) then
{
	if (_respawnName isEqualTo "") then
	{
		_respawnName = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName");
	};
	
	[_target, _object, _respawnName] remoteExec ["BIS_fnc_addRespawnPosition", 2, true];
};

CLIENT_ONLY;

// BUB 2022-10-15 TODO :: Add side-exclusivity by manipulating _condition
// Ex: (_condition) and {playerSide isEqualTo _side}
// Will need some kind of case statement because 'str _side' doesn't work for this purpose.


// Wait until mission started to add action.  Seems to require this.
[
	// Condition
	{
		time > 1
	},

	// Script
	{
		params ["_object", "_target", "_respawnName", "_condition"];

		_object addAction
		[
			"Redeploy to new location",
			{
				[] call f_fnc_doRedeployAction;
			},
			nil,		// arguments
			2,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			_condition, 	// condition
			10,			// radius
			false		// unconscious
		];
	},

	// Arguments
	_this,

	// Timeout (secs)
	-1
	
] call CBA_fnc_waitUntilAndExecute;


