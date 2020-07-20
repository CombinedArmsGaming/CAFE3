#include "macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if !(_unit isEqualTo player) exitWith {};

_type = typeOf _unit;

if (isNil "f_arr_viewDistanceActionClasses") then {f_arr_viewDistanceActionClasses = [];};
if (_type in f_arr_viewDistanceActionClasses) exitWith {};

f_arr_viewDistanceActionClasses pushBack _type;

_createViewNode =
{
    params ["_type"];

    #ifdef VIEWDISTANCE_EDITOR_WHITELISTING
        _condition =
        {
            (_player isEqualTo _target) and {_player getVariable ["f_var_allowViewDistanceEditing", false]}
        };
    #else
        _condition = {true};
    #endif

    _action =
    [
        "CA_ViewDistanceAction",
        "Set View Distance",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\scout_ca.paa",
        {createDialog "CA2_ViewDistance_Dialog";},
        _condition,
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
