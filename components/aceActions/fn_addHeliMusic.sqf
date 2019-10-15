#include "macros.hpp"

params ["_unit"];

_type = typeOf _unit;

if (isNil "f_arr_musicActionClasses") then {f_arr_musicActionClasses = [];};
if (_type in f_arr_musicActionClasses) exitWith {};

f_arr_musicActionClasses pushBack _type;

_createMusicNode =
{
    params ["_type"];

    _condition =
    {
        _vehicle = (_this select 0);
        _player = (_this select 1);

        _player isEqualTo (driver _vehicle)

    };


    _insertChildren =
    {
        params ["_target", "_player", "_params"];

        _createActionForSound =
        {
            params ["_target", "_soundName", "_readableName"];

            _actionCode = compile format ['[(_this select 0), "%1", 600, 1] remoteExec ["f_fnc_say3D"];', _soundName];

            _action =
            [
                format ["music_%1", _soundName],
                _readableName,
                "",
                _actionCode,
                {true},
                {},
                [],
                "",
                20,
                [false,false,false,false,false],
                {}
            ];

            _action call ace_interact_menu_fnc_createAction;

            [_action, [], _target]

        };


        _children = [];

        _children pushBack ([_target, "FortunateSon", "Fortunate Son (02:20)"] call _createActionForSound);
        _children pushBack ([_target, "RunJungle", "Run through the Jungle (02:46)"] call _createActionForSound);
        _children pushBack ([_target, "Riders", "Riders on the Storm (06:30)"] call _createActionForSound);
        _children pushBack ([_target, "SurfBird", "Surfin' Bird (02:20)"] call _createActionForSound);
        _children pushBack ([_target, "Valkyries", "Ride of the Valkyries (05:18)"] call _createActionForSound);
        _children pushBack ([_target, "War", "War (03:19)"] call _createActionForSound);

        _children

    };


    _action =
    [
        "CA_MusicRoot",
        "Play Music",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\listen_ca.paa",
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


[_type] call _createMusicNode;
