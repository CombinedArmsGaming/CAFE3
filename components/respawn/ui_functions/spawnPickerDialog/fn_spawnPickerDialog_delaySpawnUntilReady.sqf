#include "macros.hpp"

/*
    Delays respawn if the respawn dialog is open
*/

[
    {
        ((!(missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false])) or (playerRespawnTime < 1))
    },
    {
        if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) then
        {
            DEBUG_FORMAT1_LOG("[RESPAWN] Delaying respawn as dialog is open: %1", missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]);
            missionNamespace setVariable ["f_var_spawnPickerDialog_respawnHeld", true];
            setPlayerRespawnTime 1e10;
        };
    },
    []
] call CBA_fnc_waitUntilAndExecute;