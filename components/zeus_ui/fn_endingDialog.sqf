#include "macros.hpp"

private _endingArray = configClasses (missionConfigFile >> "CfgDebriefing");

private _endingNumbers = [];
private _endingTitles = [];

{
	private _title = getText (_x >> "Title");
  
	private _index = _endingTitles pushBackUnique _title;
  
	_endingNumbers pushBackUnique (_index + 1);
}forEach _endingArray;

["Ending Dialog",
[
	["COMBO", "Choose Ending:",[_endingNumbers, _endingTitles,0]]
],
{
	params ["_dialogValues"]
	_dialogValues params ["_endingNumber"];
  
  	["Executing Ending %1", _endingNumber]call zen_common_fnc_showMessage;
  
 	 [_endingNumber] remoteExecCall ['f_fnc_broadcastEnding', 2];
},
{},
[]]call zen_dialog_fnc_create;
