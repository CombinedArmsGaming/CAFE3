#include "macros.hpp"
/*
    For use with teleporting to group
*/
params ["_goto"];

_onTeleportFailure =
{
    hint "Failed to teleport to group leader.  You can now try again.";
    player setVariable ["f_var_mayTeleportToGroup", true, true];
};

player setVariable ["f_var_mayTeleportToGroup", false, true];

_teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

waitUntil { sleep 0.1; scriptDone _teleHandle };