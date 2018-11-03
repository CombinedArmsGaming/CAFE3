// F3 - Respawn INIT
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

CLIENT_ONLY;

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (isNull player) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit", "_corpse"];

// ====================================================================================

// SETUP KEY VARIABLES
// The Respawn eventhandler passes two parameters: the unit a player has respawned in and the corpse of the old unit.

_unit = _this select 0;
_corpse = _this select 1;

//if there is spectate and a corpse exit out
if ((getArray (missionconfigfile >> "RespawnTemplates") find "f_spectator") > -1 && !(isNull _corpse)) exitWith {};

//Remove blackout, spectate script related
[] spawn
{
    uiSleep 2;
    ["F_ScreenSetup"] call BIS_fnc_blackIn;
};

// Exit if the unit doesn't exist (can occur when JIPing into missions with no respawn)
if (isNil "_unit") exitWith {};

// ====================================================================================

// CHECK FOR GLOBAL VARIABLES
// Check if the global variables have been initialized, if not, do so with the default values.

if (isNil "f_var_JIP_JIPMenu") then {f_var_JIP_JIPMenu = true};
if (isNil "f_var_JIP_RespawnMenu") then {f_var_JIP_RespawnMenu = false};
if (isNil "f_var_JIP_RemoveCorpse") then {f_var_JIP_RemoveCorpse = false};

// ===================================================================================

// CHECK FOR FIRST TIME SPAWN

if (time < 10 && isNull _corpse) exitWith {}; //if not a JIP exit out
if (!f_var_JIP_JIPMenu && isNull _corpse) exitWith {}; // If no corpse exists the player is spawned for the first time.

// ====================================================================================

// REMOVE CORPSE
// If activated and respawn is allowed, the old corpse will be sink into the ground and is then removed from the game

if (typeof _unit != "seagull" && {f_var_JIP_RemoveCorpse && !isNull _corpse}) then
{
	_corpse spawn
    {
		hideBody _this;
		sleep 60;
		deleteVehicle _this;
	};

};

// ====================================================================================

// ADD JIP MENU TO PLAYER
// Check if player already has the JIP Menu. If not, add it.


if (!f_var_JIP_RespawnMenu && !(isNull _corpse)) exitWith {}; //do respawning players get menu?

sleep 5;

if (isNil "F3_JIP_reinforcementOptionsAction") then
{
	[player] spawn f_fnc_addJipReinforcementOptionsAction;
};
