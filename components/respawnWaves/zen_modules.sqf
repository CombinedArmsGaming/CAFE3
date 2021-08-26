call
{
    private _category = "[CA2] Respawners";

    // Set respawner object (for each side).

    private _objectWest   = { [_this#0, _this#1, west] call f_fnc_zen_setRespawnObject };
    private _objectEast   = { [_this#0, _this#1, east] call f_fnc_zen_setRespawnObject };
    private _objectIndfor = { [_this#0, _this#1, independent] call f_fnc_zen_setRespawnObject };
    private _objectCiv    = { [_this#0, _this#1, civilian] call f_fnc_zen_setRespawnObject };

    [_category, "Set Respawner Object (BLUFOR)", _objectWest] call zen_custom_modules_fnc_register;
    [_category, "Set Respawner Object (OPFOR)", _objectEast] call zen_custom_modules_fnc_register;
    [_category, "Set Respawner Object (INDFOR)", _objectIndfor] call zen_custom_modules_fnc_register;
    [_category, "Set Respawner Object (Civilian)", _objectCiv] call zen_custom_modules_fnc_register;


    // Set respawn marker (for each side).

    private _markerWest   = { [_this#0, west] call f_fnc_zen_moveRespawnMarker };
    private _markerEast   = { [_this#0, east] call f_fnc_zen_moveRespawnMarker };
    private _markerIndfor = { [_this#0, independent] call f_fnc_zen_moveRespawnMarker };
    private _markerCiv    = { [_this#0, civilian] call f_fnc_zen_moveRespawnMarker };

    [_category, "Move Respawn Marker (BLUFOR)", _markerWest] call zen_custom_modules_fnc_register;
    [_category, "Move Respawn Marker (OPFOR)", _markerEast] call zen_custom_modules_fnc_register;
    [_category, "Move Respawn Marker (INDFOR)", _markerIndfor] call zen_custom_modules_fnc_register;
    [_category, "Move Respawn Marker (Civilian)", _markerCiv] call zen_custom_modules_fnc_register;


    // Create player spawner (for each side).

    private _spawnerWest   = { [_this#0, west] call f_fnc_zen_createSpawner };
    private _spawnerEast   = { [_this#0, east] call f_fnc_zen_createSpawner };
    private _spawnerIndfor = { [_this#0, independent] call f_fnc_zen_createSpawner };
    private _spawnerCiv    = { [_this#0, civilian] call f_fnc_zen_createSpawner };

    [_category, "Respawn Random Player (BLUFOR)", _spawnerWest] call zen_custom_modules_fnc_register;
    [_category, "Respawn Random Player (OPFOR)", _spawnerEast] call zen_custom_modules_fnc_register;
    [_category, "Respawn Random Player (INDFOR)", _spawnerIndfor] call zen_custom_modules_fnc_register;
    [_category, "Respawn Random Player (Civilian)", _spawnerCiv] call zen_custom_modules_fnc_register;

};
