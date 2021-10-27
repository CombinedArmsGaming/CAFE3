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

CLIENT_ONLY;

if(player getVariable ["f_var_turnZeusInvisible", true])then
{
	player setCaptive true; //Disables AI seeing the Zeus player as hostile when talking in direct speech while hidden
	[player, false] remoteExec ["f_fnc_activatePlayer", 2]; 
};

[]spawn //you need to wait for Zeus to actually be open to create the dialog
{
	disableSerialization;
	waitUntil
	{
		uiSleep 0.15;
		!isNull (findDisplay 312)
	};

	// Start the custom Zeus UI
	["ui_init"] call f_fnc_zeusUI;
};