#include "macros.hpp"

// private _action = 
// [
// 	"WoundUnitRandomly",
// 	"Wound Unit Randomly",
// 	["",[1,1,1,1]],
// 	{
// 	[_hoveredEntity] remoteExec ["f_fnc_zen_doWoundUnitRandomly", 2];
// 	},
// 	{
// 		typeOf _hoveredEntity isKindOf "Man";
// 	}
// ] call zen_context_menu_fnc_createAction;

private _action = [
    "HintTime",
    "Hint Time",
    "\a3\ui_f\data\igui\rsctitles\mpprogress\timer_ca.paa",
    {hint format ["Time - %1", [daytime] call BIS_fnc_timeToString]}
] call zen_context_menu_fnc_createAction;
systemChat "wot";
[_action, ["CA2 Misc"], 0] call zen_context_menu_fnc_addAction;