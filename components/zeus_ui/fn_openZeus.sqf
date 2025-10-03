/* --------------------------------------------------------------------------------------------------------------------
	Author:		Joecuronium
	Description:
		Handles opening the Zeus Display
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */


#include "macros.hpp"
#include "config\macros.hpp"

CLIENT_ONLY;

// Initialisation
if (!cafe_zeusUI_isInitialised) then {
	cafe_zeusUI_isInitialised = true;

	player setVariable ["f_var_isZeus", true, true];
	player setVariable ["f_var_isKillLogRecipient", true, true];

	player addCuratorEditableObjects [(vehicles + allUnits + allDeadMen), true];
	player removeCuratorEditableObjects [player, true];

	[] call f_fnc_addZeusActions;
};

// Godmode
[player, true] call f_fnc_giveUnitGodmode;

if (player getVariable ["f_var_turnZeusInvisible", true]) then
{
	player setCaptive true; //Disables AI seeing the Zeus player as hostile when talking in direct speech while hidden
	[player, false] remoteExecCall ["f_fnc_activatePlayer", 2];
};

[] spawn //you need to wait for Zeus to actually be open to create the dialog
{
	disableSerialization;
	waitUntil
	{
		uiSleep 0.15;
		!isNull (findDisplay 312)
	};

	// Start the custom Zeus UI
	["ui_init"] call f_fnc_zeusUI;
	["ui_init", MACRO_VARNAME_UI_ID_NOTIFIER] call f_fnc_zeusUI;

	private _eventID = [
		MACRO_VARNAME_SERVER_NOTIF_EVENT,
		// Pass the changed list to the refresh function
		{["ui_notifier_refresh", _this] call f_fnc_zeusUI}
	] call CBA_fnc_addEventHandlerArgs;
	missionNamespace setVariable ["f_var_notifierEH", _eventID];

    if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then
	{
		[] call acre_sys_zeus_fnc_handleZeusSpeakPress;  //Fallback in case the variable goes missing.
	};
};
