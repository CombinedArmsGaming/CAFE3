// CA respawn system with wave respawns

#include "..\macros.hpp"
CLIENT_ONLY;


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (isNull player) then
{
    waitUntil
    {
        sleep 0.1;
        !isNull player;
        !isNil "f_var_initServer"
    };

};


params ["_unit","_corpse"];

if (!f_var_JIP_JIPMenu && isNull _corpse) exitWith {}; // If no corpse exists the player is spawned for the first time.

if (time < 10 && isNull _corpse) exitWith {}; //if not a JIP and its the start of the mission exit out


{
    _unit removeItem _x;

} forEach ([] call acre_api_fnc_getCurrentRadioList);  //Remove any additional radios that might get spawned


// Join in progress and instant respawn handling
if ((time < 10) || (isNull _corpse)) exitWith
{
    _loadout = (_unit getVariable "f_var_assignGear");
    _unit setVariable ["f_var_assignGear_done", false, true];

    [_loadout, player] call f_fnc_assignGear;

    if (!f_var_JIP_JIPMenu) exitWith {}; //do JIP players get teleport menu?

    sleep 5;

    if (isNil "F3_JIP_reinforcementOptionsAction") then
    {
    	[player] spawn f_fnc_addJipReinforcementOptionsAction;
    };

};


if (!f_var_respawnInGroup) then
{
    [player] join grpNull;
};


// Enter spectator
[true] call ace_spectator_fnc_setSpectator;


{
    _unit removeItem _x;

} forEach ([] call acre_api_fnc_getCurrentRadioList);  //Remove any additional radios for sure


// Wait for respawn to happen
waitUntil { ca_respawnwave };


// F3 assign radio and gear
_loadout = (_unit getVariable "f_var_assignGear");
_unit setVariable ["f_var_assignGear_done", false, true];
[_loadout, player] call f_fnc_assignGear;

// Exit spectator and setpos to respawn_west
[false] call ace_spectator_fnc_setSpectator;

if (!f_var_JIP_RespawnMenu) exitWith {}; //do respawning players get menu?

sleep 5;

if (isNil "F3_JIP_reinforcementOptionsAction") then
{
    [player] spawn f_fnc_addJipReinforcementOptionsAction;
};

// [_unit] call ca_fnc_parachute;
