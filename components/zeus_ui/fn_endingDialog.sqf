#include "macros.hpp"

private _endingArray = "true" configClasses (missionConfigFile >> "CfgDebriefing"); //Gather all endings

private _endingClasses = [];
private _endingTitles = [];

{
	private _title = getText (_x >> "Title");

	_endingTitles pushBackUnique _title;
  
	private _class = configName (_x);
  
	_endingClasses pushBackUnique _class;
	
} forEach _endingArray;						//iterate Endings and populate dialog arrays


["Ending Dialog",
	[
		["COMBO", "Choose Ending:",[_endingClasses, _endingTitles,0]]
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
