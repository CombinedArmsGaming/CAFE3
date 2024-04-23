#include "macros.hpp"

params ["_target", "_player", "_params"];

private _children = _this call acre_ace_interact_fnc_radioListChildrenActions_original;

// Update group radio channels
private _action =
[
    "CAFE_SetSquadChannels",
    "Force my channels to all squad members",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa",
    f_fnc_acre_forceGroupRadioOverrides,
    {(leader group _player) isEqualTo _player},
    {},
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];

_action call ace_interact_menu_fnc_createAction;

_children pushBack [_action, [], _target];


// Get group radio channels
_action =
[
    "CAFE_GetSquadChannels",
    "Reset my channels to squad defaults",
    "\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa",
    f_fnc_acre_resetPlayerRadioConfig,
    {true},
    {},
    [],
    "",
    20,
    [false,false,false,false,false],
    {}
];

_action call ace_interact_menu_fnc_createAction;

_children pushBack [_action, [], _target];


_children
