/*
	Created By: JC
*/
#include "../macros.hpp"

CLIENT_ONLY;

params ["_object"];

if (isNull _object) exitWith
{
    ["No object selected."] call zen_common_fnc_showMessage;
};

["Create IED",
	[
		["CHECKBOX", "Large IED?", false],
		["CHECKBOX", "Is proximity-fused?", false],
		["SIDES", "Activated by side (for proximity fuses)", west],
		["SLIDER:RADIUS", "Proximity fusing range (metres)", [0, 100, 10, 1, _object, [1, 0, 0, 1]]]
	],
	{
		params ["_dialogValues", "_args"];

		_dialogValues params ["_isLarge", "_isProxy", "_proxySide", "_proxyRange"];
		_args params ["_object"];

		private _isAlreadyIED = _object getVariable ["isIED", false];

		if (_isAlreadyIED) then 
		{
			["Object is already an IED.", _object] call zen_common_fnc_showMessage;
		} 
		else 
		{
			[_object, _isLarge, _isProxy, _proxySide, _proxyRange] remoteExec ["f_fnc_addIEDToObject", 2];
			["This object is now an IED: '%1'.", _object] call zen_common_fnc_showMessage;
		};
	},
	{},
	[_object]
] call zen_dialog_fnc_create;
