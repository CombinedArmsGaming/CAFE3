#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting zenFunctions")

if !(isNil 'zen_custom_modules_fnc_register') then
{

    // Set respawner object (for each side).

    _objectWest   = {[_this#0, _this#1, west] call f_fnc_setRespawnObject};
    _objectEast   = {[_this#0, _this#1, east] call f_fnc_setRespawnObject};
    _objectIndfor = {[_this#0, _this#1, independent] call f_fnc_setRespawnObject};
    _objectCiv    = {[_this#0, _this#1, civilian] call f_fnc_setRespawnObject};

    ["[CA2] Respawners", "Set Respawner Object (BLUFOR)", _objectWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (OPFOR)", _objectEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (INDFOR)", _objectIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Set Respawner Object (Civilian)", _objectCiv] call zen_custom_modules_fnc_register;


    // Set respawn marker (for each side).

    _markerWest   = {[_this#0, west] call f_fnc_moveRespawnMarker};
    _markerEast   = {[_this#0, east] call f_fnc_moveRespawnMarker};
    _markerIndfor = {[_this#0, independent] call f_fnc_moveRespawnMarker};
    _markerCiv    = {[_this#0, civilian] call f_fnc_moveRespawnMarker};

    ["[CA2] Respawners", "Move Respawn Marker (BLUFOR)", _markerWest] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (OPFOR)", _markerEast] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (INDFOR)", _markerIndfor] call zen_custom_modules_fnc_register;
    ["[CA2] Respawners", "Move Respawn Marker (Civilian)", _markerCiv] call zen_custom_modules_fnc_register;
};
