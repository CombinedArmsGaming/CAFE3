/* --------------------------------------------------------------------------------------------------------------------
	Author:		Joecuronium
	Description:
		Adds actions to ZEUS ACE-interact that allows Zeus to choose certain behaviours in relation to ACRE and self-teleport.
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */


#include "macros.hpp"

CLIENT_ONLY;

if !(player getVariable ["f_var_isZeus",false]) exitWith {}; // Fallback in case the script execution is run on the wrong machine


//ACRE actions
private _talkThroughZeus =
{
	[] call acre_sys_zeus_fnc_handleZeusSpeakPress;
	["Now talking through Zeus camera"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"TalkThroughZeus",
	"Switch to Camera Speaker",
	"",
	_talkThroughZeus,
	{!(_player getVariable ["acre_sys_zeus_inZeus", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "ACRE_ZeusEars"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


private _talkThroughUnit =
{
	[] call acre_sys_zeus_fnc_handleZeusSpeakPressUp;
	["Now talking through Unit"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"TalkThroughUnit",
	"Switch to Unit Speaker",
	"",
	_talkThroughUnit,
	{(_player getVariable ["acre_sys_zeus_inZeus", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "ACRE_ZeusEars"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


//CAFE3 Zeus actions node
private _zeusNode = [
        "CAFE3_Zeus",
        "CAFE3 Zeus Menu",
        "",
        {},
        {true}
    ] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions"], _zeusNode] call ace_interact_menu_fnc_addActionToZeus;


//Teleport options
private _zeusTeleportToCam =
{
	_player setVariable ["f_var_zeusTeleportToCam", true, true];
	["Zeus unit now teleporting to cam exit pos"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"TeleportUnit",
	"Teleport Zeus unit to camera exit",
	"",
	_zeusTeleportToCam,
	{!(_player getVariable ["f_var_zeusTeleportToCam", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "CAFE3_Zeus"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


private _zeusNoTeleport =
{
	_player setVariable ["f_var_zeusTeleportToCam", false, true];
	["Zeus Unit now staying static on camera exit"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"DontTeleportUnit",
	"Disable teleporting Zeus unit to camera exit",
	"",
	_zeusNoTeleport,
	{(_player getVariable ["f_var_zeusTeleportToCam", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "CAFE3_Zeus"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


//Zeus hiding options
private _turnZeusInvisible =
{
	_player setVariable ["f_var_turnZeusInvisible", true, true];
	_player setCaptive true; // Disables AI seeing the Zeus player as hostile when talking in direct speech while hidden
	[_player, false] remoteExecCall ["f_fnc_activatePlayer", 2];

	["Zeus unit now being hidden"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"HideUnit",
	"Hide Zeus Unit",
	"",
	_turnZeusInvisible,
	{!(_player getVariable ["f_var_turnZeusInvisible", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "CAFE3_Zeus"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


private _noTurnZeusInvisible =
{
	_player setVariable ["f_var_turnZeusInvisible", false, true];

	if (!cafe_ceasefire_active) then {	// Disables AI seeing the Zeus player as hostile when talking in direct speech while hidden
		_player setCaptive false;
	};
	[_player, true] remoteExecCall ["f_fnc_activatePlayer", 2];

	["Zeus Unit now visible"] call zen_common_fnc_showMessage;
};

private _actionToBeAdded =
[
	"ShowUnit",
	"Show Zeus Unit",
	"",
	_noTurnZeusInvisible,
	{(_player getVariable ["f_var_turnZeusInvisible", false])}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "CAFE3_Zeus"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;


//Ending Dialog
private _endingDialog =
{
	[] call f_fnc_endingDialog;
};

private _actionToBeAdded =
[
	"endingDialog",
	"Endings Dialog",
	"",
	_endingDialog,
	{true}
] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions", "CAFE3_Zeus"], _actionToBeAdded] call ace_interact_menu_fnc_addActionToZeus;

// Initialize default behaviour
[] call acre_sys_zeus_fnc_handleZeusSpeakPress;
player setVariable ["f_var_zeusTeleportToCam", true, true];
player setVariable ["f_var_turnZeusInvisible", true, true];

DEBUG_PRINT_LOG("[Zeus] Init complete");
