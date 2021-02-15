#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zenFunctions")

if !(isNil 'zen_custom_modules_fnc_register') then
{

    // Set respawner object (for each side).

    _objectWest   = {[_this#0, _this#1, west] call f_fnc_zen_setRespawnObject};
    _objectEast   = {[_this#0, _this#1, east] call f_fnc_zen_setRespawnObject};
    _objectIndfor = {[_this#0, _this#1, independent] call f_fnc_zen_setRespawnObject};
    _objectCiv    = {[_this#0, _this#1, civilian] call f_fnc_zen_setRespawnObject};

    ["[CA2] Respawners", "Set Respawner Object (BLUFOR)", _objectWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (OPFOR)", _objectEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (INDFOR)", _objectIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (Civilian)", _objectCiv] call zen_custom_modules_fnc_register;


    // Set respawn marker (for each side).

    _markerWest   = {[_this#0, west] call f_fnc_zen_moveRespawnMarker};
    _markerEast   = {[_this#0, east] call f_fnc_zen_moveRespawnMarker};
    _markerIndfor = {[_this#0, independent] call f_fnc_zen_moveRespawnMarker};
    _markerCiv    = {[_this#0, civilian] call f_fnc_zen_moveRespawnMarker};

    ["[CA2] Respawners", "Move Respawn Marker (BLUFOR)", _markerWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (OPFOR)", _markerEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (INDFOR)", _markerIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (Civilian)", _markerCiv] call zen_custom_modules_fnc_register;


    // Create player spawner (for each side).

    _spawnerWest   = {[_this#0, west] call f_fnc_zen_createSpawner};
    _spawnerEast   = {[_this#0, east] call f_fnc_zen_createSpawner};
    _spawnerIndfor = {[_this#0, independent] call f_fnc_zen_createSpawner};
    _spawnerCiv    = {[_this#0, civilian] call f_fnc_zen_createSpawner};

    ["[CA2] Respawners", "Respawn Random Player (BLUFOR)", _spawnerWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (OPFOR)", _spawnerEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (INDFOR)", _spawnerIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Respawn Random Player (Civilian)", _spawnerCiv] call zen_custom_modules_fnc_register;

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
