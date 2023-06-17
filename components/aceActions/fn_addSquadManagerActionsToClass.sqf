#include "macros.hpp"
#include "..\..\respawn_macros.hpp"

params ["_unit"];

if !(_unit isEqualTo player) exitWith {};

_type = typeOf _unit;

if (isNil "f_arr_squadManagerActionClasses") then {f_arr_squadManagerActionClasses = [];};
if (_type in f_arr_squadManagerActionClasses) exitWith {};

f_arr_squadManagerActionClasses pushBack _type;

_createSquadNode =
{
    params ["_type"];

    _condition =
    {
        _player isEqualTo _target
    };


    _insertChildren =
    {
        params ["_target", "_player", "_params"];

        _children = [];

        private _shouldShowRespawnDialog = 
        {
            (_player getVariable ["f_var_canUseRespawnMenu", false]) and {[RESPAWN_TRIGGERED_WAVE] call f_fnc_isRespawnModeActive}
        };

        // Respawn menu action
        _action =
        [
            "CAFE_RespawnMenu",
            "Show Respawn Menu",
            "\A3\ui_f\data\igui\cfg\simpleTasks\types\getin_ca.paa",
            {createDialog "CAFE_TriggerRespawnWave_Dialog";},
            _shouldShowRespawnDialog,
            {},
            [],
            "",
            20,
            [false,false,false,false,false],
            {}
        ];

        _action call ace_interact_menu_fnc_createAction;

        _children pushBack [_action, [], _target];


        // Squad marker menu action
        _action =
        [
            "CAFE_SquadMarkerMenu",
            "Edit Squad Markers",
            "\A3\ui_f\data\igui\cfg\simpleTasks\types\move_ca.paa",
            {createDialog "CAFE_SquadMarker_Dialog";},
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


        // Squad selection menu action
        _action =
        [
            "CAFE_ChangeSquadMenu",
            "Choose a Squad",
            "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa",
            {createDialog "CAFE_GroupPicker_Dialog";},
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

    };


    _action =
    [
        "CA_SquadManagerRoot",
        "CA Squad Actions",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa",
        {},
        _condition,
        _insertChildren,
        [],
        "",
        20,
        [false,false,false,false,false],
        {}
    ];

    _action call ace_interact_menu_fnc_createAction;

    [_type, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

};


[_type] call _createSquadNode;
