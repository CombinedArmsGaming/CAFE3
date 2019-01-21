#include "macros.hpp"

CLIENT_ONLY;


waitUntil {!isNull player and time > 1};

_createDialogAction =
{
	createDialog 'RespawnWavesDialog';
};

_action = ["RespawnWavesDialog", "View Respawn Waves", "", _createDialogAction, {player getVariable ["f_var_canUseRespawnMenu", false]}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

player setVariable ["f_var_hasRespawnMenuAction", true];
