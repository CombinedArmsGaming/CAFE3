#include "macros.hpp"

/*
    Populates the gear list whenever the loadout selection changes
*/

disableSerialization;

_getWeaponReadable = {
    params ["_weapon", ["_config", "CfgWeapons"]];
    if (!(_weapon isEqualType "")) then {
        DEBUG_FORMAT1_LOG("[RESPAWN] _weapon was not a String! Weapon: %1", _weapon);
    };
    private _configNode = configFile >> _config >> _weapon;
	
	if !(isNull _configNode) then {getText (_configNode >> "displayName")}
	else {
        _configNode = configFile >> "CfgMagazines" >> _weapon;
        if !(isNull _configNode) then {getText (_configNode >> "displayName")} 
        else {_weapon}
    }
};

params ["_loadoutsList", "_lbCurSel"];

private _gearList = findDisplay IDD_SPAWNPICKER_DIALOG displayCtrl IDC_GEARLIST;
lbClear _gearList;

private _typeOfUnit = _loadoutsList lbData _lbCurSel;
private _faction = toLower (faction player);
private _gearVariant = [_faction] call f_fnc_factionToSideName;


DEBUG_PRINT_LOG("[RESPAWN] Updating gear with new selection");

private _loadoutVariants = LOADOUT_VAR_DYNAMIC(_gearVariant,_typeOfUnit);



private _loadout = selectRandom _loadoutVariants;
DEBUG_FORMAT1_LOG("[RESPAWN] Loadout is: %1", _loadout);

// If using ace arsenal extended, it tacks on an extra layer of array so the loadout looks like [loadout, []]
if (count _loadout == 2) then {_loadout = _loadout # 0};

// Select the first three elements from the loadout (the three weapon arrays) and then get their className, which is index 0, or "" if there is no weapon there
private _weapons = (_loadout select [0, 3]) apply {if (count _x > 0) then {_x select 0} else {""}};
DEBUG_FORMAT1_LOG("[RESPAWN] Weapons array is: %1", _weapons);
private _weaponsReadable = [];
{
    if (_x isNotEqualTo "") then {_weaponsReadable pushBack ([_x] call _getWeaponReadable);} 
    else {
        switch (_forEachIndex) do {
            case 0: {_weaponsReadable pushBack "No primary weapon"};
            case 1: {_weaponsReadable pushBack "No launcher"};
            case 2: {_weaponsReadable pushBack "No secondary weapon"};
        };
    };
} forEach _weapons;
_weaponsReadable = _weaponsReadable apply {"   " + _x};

DEBUG_FORMAT1_LOG("[RESPAWN] weaponsReadable is %1", _weaponsReadable);
{
    switch (_forEachIndex) do {
        case 0: {_gearList lbAdd "Primary:"; _gearList lbAdd _x;};
        case 1: {_gearList lbAdd "Launcher:"; _gearList lbAdd _x;};
        case 2: {_gearList lbAdd "Secondary:"; _gearList lbAdd _x;};
    };
} forEach _weaponsReadable;

// Add items in the uniform/vest/backpack to the gearList
// Takes an array that should be ["name", [items]]
private _addItemsInContainer = {
    params ["_containerArray", ["_config", "CfgWeapons"]];
    private _containerName = [_containerArray select 0, _config] call _getWeaponReadable;
    _gearList lbAdd ("In " + _containerName + ":");
    private _gearInContainer = _containerArray select 1;
    {
        private _gearName = [_x select 0] call _getWeaponReadable;
        private _gearQuantity = str (_x select 1);
        _gearList lbAdd ("   " + _gearQuantity + "x " + _gearName);
    } forEach _gearInContainer;
};

private _uniformArray = _loadout select 3;
if (count _uniformArray > 0) then {
    DEBUG_FORMAT2_LOG("[RESPAWN] Adding uniform with name %1, contents %2", _uniformArray # 0, _uniformArray # 1);
    [_uniformArray] call _addItemsInContainer;
} else {
    DEBUG_PRINT_LOG("[RESPAWN] No uniform");
    _gearList lbAdd ("No uniform");
};

private _vestArray = _loadout select 4;
if (count _vestArray > 0) then {
    DEBUG_FORMAT2_LOG("[RESPAWN] Adding vest with name %1, contents %2", _vestArray # 0, _vestArray # 1);
    [_vestArray] call _addItemsInContainer;
} else {
    DEBUG_PRINT_LOG("[RESPAWN] No vest");
    _gearList lbAdd ("No vest");
};

private _backpackArray = _loadout select 5;
if (count _backpackArray > 0) then {
    DEBUG_FORMAT2_LOG("[RESPAWN] Adding backpack with name %1, contents %2", _backpackArray # 0, _backpackArray # 1);
    [_backpackArray, "CfgVehicles"] call _addItemsInContainer;
} else {
    DEBUG_PRINT_LOG("[RESPAWN] No backpack");
    _gearList lbAdd ("No backpack");
};