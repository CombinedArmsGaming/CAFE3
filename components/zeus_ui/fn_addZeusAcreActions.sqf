#include "macros.hpp"

CLIENT_ONLY;

private _script =
{
	[]call acre_sys_zeus_fnc_handleZeusSpeakPress;
	["Now talking through Zeus camera"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"TalkThroughZeus",
	"Switch to Camera Speaker",
	"",
	_script,
	{!(_player getVariable ["acre_sys_zeus_inZeus", false])}
]call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "ACRE_ZeusEars"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


private _script =
{
	[]call acre_sys_zeus_fnc_handleZeusSpeakPressUp;
	["Now talking through Unit"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"TalkThroughUnit",
	"Switch to Unit Speaker",
	"",
	_script,
	{(_player getVariable ["acre_sys_zeus_inZeus", false])}
]call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "ACRE_ZeusEars"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


DEBUG_PRINT_LOG("[Joe-brand Zeus rework] Init complete");