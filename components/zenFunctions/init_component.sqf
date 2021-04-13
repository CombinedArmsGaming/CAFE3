#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zenFunctions")

if !(isNil 'zen_custom_modules_fnc_register') then
{

    // Set respawner object.

    _object   = {[_this#0, _this#1] call f_fnc_zen_setRespawnObject};

    ["[CA2] Respawners", "Set Respawner Object", _object] call zen_custom_modules_fnc_register;

    // Set respawn marker.

    _marker   = {[_this#0] call f_fnc_zen_moveRespawnMarker};


    ["[CA2] Respawners", "Move Respawn Marker", _marker] call zen_custom_modules_fnc_register;

    // Create player spawner.

    _spawner   = {[_this#0] call f_fnc_zen_createSpawner};

    ["[CA2] Respawners", "Respawn Random Player", _spawner] call zen_custom_modules_fnc_register;


    if !(isNil 'kyk_ew_fnc_broadcastJammerAdd') then
    {
        _jammerCreate = {[_this#1] call f_fnc_zen_createJammer};

        ["[CA2] Electronic Warfare", "Create Jammer", _jammerCreate] call zen_custom_modules_fnc_register;

        _jammerRemove = {[_this#1] call f_fnc_zen_removeJammers};

        ["[CA2] Electronic Warfare", "Remove Jammer", _jammerRemove] call zen_custom_modules_fnc_register;
    };
    
    _woundUnit = {_this#1 call f_fnc_zen_woundUnitRandomly};

    ["[CA2] Misc", "Wound Unit Randomly", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundUnitRandomlyAdvanced};

    ["[CA2] Misc", "Wound Unit (Advanced)", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundGroupRandomly};

    ["[CA2] Misc", "Wound Group Randomly", _woundUnit] call zen_custom_modules_fnc_register;

    _woundUnit = {_this#1 call f_fnc_zen_woundGroupRandomlyAdvanced};

    ["[CA2] Misc", "Wound Group (Advanced)", _woundUnit] call zen_custom_modules_fnc_register;
};
