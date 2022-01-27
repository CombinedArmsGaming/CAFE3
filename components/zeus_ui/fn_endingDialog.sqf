#include "macros.hpp"

private _endingArray = "true" configClasses (missionConfigFile >> "CfgDebriefing"); //Gather all endings

private _endingClasses = [];
private _endingNames = [];

{
	private _title = getText (_x >> "Title");

	private _subtitle = getText (_x >> "subtitle");

	private _name = _title + " - " + _subtitle;

	_endingNames pushBackUnique _name;
  
	private _class = configName (_x);
  
	_endingClasses pushBackUnique _class;
	
} forEach _endingArray;						//iterate Endings and populate dialog arrays


["Ending Dialog",
	[
		["COMBO", "Choose Ending:",[_endingClasses, _endingNames,0]]
	],
	{
		params ["_dialogValues"];
		_dialogValues params ["_endingClass"];

		["Executing Ending %1", _endingClass] call zen_common_fnc_showMessage;

		 [_endingClass] remoteExecCall ['f_fnc_broadcastEnding', 2];
	},
	{},
	[]
] call zen_dialog_fnc_create;
