#include "macros.hpp"

CLIENT_ONLY;

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_viewDistanceActionClasses") then {f_arr_viewDistanceActionClasses = [];};
if (_type in f_arr_viewDistanceActionClasses) exitWith {};

f_arr_viewDistanceActionClasses pushBack _type;

_createViewNode =
{
    params ["_type"];

    _action =
    [
        "CA_ViewDistanceAction",
        "Set View Distance",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\scout_ca.paa",
        {createDialog "CA2_ViewDistance_Dialog";},
        {true},
        {},
        [],
        "",
        20,
        [false,false,false,false,false],
        {}
    ];

    _action call ace_interact_menu_fnc_createAction;

    [_type, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

};


[_type] call _createViewNode;
