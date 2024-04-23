#include "macros.hpp"

params ["_unit"];

private _type = typeOf _unit;

if (isNil "f_arr_hunterKillerActionClasses") then {f_arr_hunterKillerActionClasses = [];};
if (_type in f_arr_hunterKillerActionClasses) exitWith {};

f_arr_hunterKillerActionClasses pushBack _type;




private _enableCondition =
{
    params ["_vehicle", "_player"];
    private _role = toLower ((assignedVehicleRole player) param [0, "cargo"]);

    private _playerCanUse = ((vehicle _player) isEqualTo _vehicle) and {!(_role isEqualTo "cargo")};
    private _hunterKillerNotActive = !(_vehicle getVariable ["ace_hunterkiller", false]);

    _playerCanUse and _hunterKillerNotActive;

};


private _disableCondition =
{
    params ["_vehicle", "_player"];
    private _role = toLower ((assignedVehicleRole player) param [0, "cargo"]);

    private _playerCanUse = ((vehicle _player) isEqualTo _vehicle) and {!(_role isEqualTo "cargo")};
    private _hunterKillerActive = (_vehicle getVariable ["ace_hunterkiller", false]);

    _playerCanUse and _hunterKillerActive;

};


private _onEnable =
{
    params ["_vehicle"];
    private _vicType = typeOf _vehicle;
    private _hunterKillerValue = f_dict_hunterKillerOverrides getOrDefault [_vicType, true];

    _vehicle setVariable ["ace_hunterkiller", _hunterKillerValue, true];
};


private _onDisable =
{
    params ["_vehicle"];
    _vehicle setVariable ["ace_hunterkiller", false, true];
};


private _enableAction =
[
    "CA_EnableHunterKiller",
    "Enable ACE Hunter-Killer",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\kill_ca.paa",
    _onEnable,
    _enableCondition,
    nil,
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];


private _disableAction =
[
    "CA_DisableHunterKiller",
    "Deactivate ACE Hunter-Killer",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\kill_ca.paa",
    _onDisable,
    _disableCondition,
    nil,
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];


_enableAction call ace_interact_menu_fnc_createAction;
_disableAction call ace_interact_menu_fnc_createAction;


[_type, 1, ["ACE_SelfActions"], _enableAction, true] call ace_interact_menu_fnc_addActionToClass;
[_type, 1, ["ACE_SelfActions"], _disableAction, true] call ace_interact_menu_fnc_addActionToClass;
