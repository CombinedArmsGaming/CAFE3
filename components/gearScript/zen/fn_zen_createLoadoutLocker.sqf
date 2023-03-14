#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", "_unit"];

if ((!isNull _unit) and {_unit getVariable ["f_var_isLoadoutLocker", false]}) exitWith
{
    ["This object is already a loadout locker and cannot be reassigned."] call zen_common_fnc_showMessage;
};


private _createLocker = 
{
    params ["_dialogValues", "_args"];
    _dialogValues params ["_chosenFaction"];
    _args params ["_position", "_locker"];

    if (isNull _locker) then
    {
        private _lockerModel = ["Metal_Locker_F", "Land_OfficeCabinet_02_F"] select (isNull (configFile >> "CfgVehicles" >> "Metal_Locker_F"));
        _locker = _lockerModel createVehicle [0,0,0];
        _locker setPosASL _position;
    };

    // In case picked object becomes a locker while zeus is in the side selection menu.
    if (_locker getVariable ["f_var_isLoadoutLocker", false]) exitWith
    {
        ["This object is already a loadout locker and cannot be reassigned."] call zen_common_fnc_showMessage;
    };
    
    [_locker, _chosenFaction] remoteExec ["f_fnc_createLoadoutLocker", 0, _locker];
};

private _potentialSides =
[
    ["BLUFOR",    "blu_f"],
    ["OPFOR",     "opf_f"],
    ["INDFOR",    "ind_f"],
    ["Civilian",  "civ_f"],
    ["Guerrilla", "blu_g_f"]
];

private _sidesInUse = _potentialSides select { CRATE_REGISTRY_DYNAMIC(toLower (_x # 0)) isNotEqualTo [] };

[
    "Choose Gearscript Side",
    [
    	["LIST", "Choose gearscript side", [_sidesInUse apply {_x#1}, _sidesInUse apply {_x#0}, 0, (count _sidesInUse)]]
    ],
    _createLocker,
    {},
    _this

] call zen_dialog_fnc_create;
