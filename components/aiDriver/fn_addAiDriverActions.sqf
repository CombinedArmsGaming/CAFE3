#include "macros.hpp"

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_driverActionClasses") then {f_arr_driverActionClasses = [];};
if (_type in f_arr_driverActionClasses) exitWith {};

f_arr_driverActionClasses pushBack _type;




_commanderCondition =
{
    _vehicle = (_this select 0);
    _player = (_this select 1);
    _role = toLower ((assignedVehicleRole player) param [0, "cargo"]);

    ((vehicle _player) isEqualTo _vehicle) and {!(_role isEqualTo "cargo")}

};


_enableCondition =
{
    _vehicle = (_this select 0);
    _player = (_this select 1);
    _role = toLower ((assignedVehicleRole player) param [0, "cargo"]);

    _playerCanUse = ((vehicle _player) isEqualTo _vehicle) and {!(_role isEqualTo "cargo")};
    _driverNotActive = !(_vehicle getVariable ["f_var_aiDriverEnabled", false]);

    _playerCanUse and _driverNotActive;

};


_disableCondition =
{
    _vehicle = (_this select 0);
    _player = (_this select 1);
    _role = toLower ((assignedVehicleRole player) param [0, "cargo"]);

    _playerCanUse = ((vehicle _player) isEqualTo _vehicle) and {!(_role isEqualTo "cargo")};
    _driverActive = (_vehicle getVariable ["f_var_aiDriverEnabled", false]);

    _playerCanUse and _driverActive;

};




_onCommander =
{
    [(_this select 0), (_this select 1)] remoteExec ["f_fnc_designateEffectiveCommander", 2];
};


_onEnable =
{
    [(_this select 0)] remoteExec ["f_fnc_activateAiDriver", 2];
};


_onDisable =
{
    [(_this select 0)] remoteExec ["f_fnc_deactivateAiDriver", 2];
};




_commanderAction =
[
    "CA_SetVehCommander",
    "Become AI Commander",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\navigate_ca.paa",
    _onCommander,
    _commanderCondition,
    nil,
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];


_enableAction =
[
    "CA_EnableAIDriver",
    "Add AI Driver",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\car_ca.paa",
    _onEnable,
    _enableCondition,
    nil,
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];


_disableAction =
[
    "CA_DisableAIDriver",
    "Remove AI Driver",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\car_ca.paa",
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
_commanderAction call ace_interact_menu_fnc_createAction;


[_type, 1, ["ACE_SelfActions"], _enableAction, true] call ace_interact_menu_fnc_addActionToClass;
[_type, 1, ["ACE_SelfActions"], _disableAction, true] call ace_interact_menu_fnc_addActionToClass;
[_type, 1, ["ACE_SelfActions"], _commanderAction, true] call ace_interact_menu_fnc_addActionToClass;
