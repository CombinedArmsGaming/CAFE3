#include "macros.hpp"

CLIENT_ONLY;


waitUntil {!isNull player and time > 1};

if (player getVariable ["f_var_hasSquadMarkerMenuAction", false] isEqualTo true) exitWith {};

_createDialogAction =
{
	createDialog 'CA2_SquadMarker_Dialog';
};

_action = ["SquadMarkerDialog", "Edit Squad Marker", "", _createDialogAction, {(leader group player) isEqualTo player}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

player setVariable ["f_var_hasSquadMarkerMenuAction", true];
