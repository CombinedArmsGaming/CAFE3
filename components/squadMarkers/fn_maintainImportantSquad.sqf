#include "macros.hpp"

SERVER_ONLY;

params ["_group"];

WAIT_UNTIL_MISSION_STARTED;

if !EXISTS(_group) exitWith
{
    DEBUG_PRINT_CHAT("Tried to register an important squad that does not exist.")
};

private _squadDict = createHashMap;

[_group, _squadDict] spawn
{
    params ["_group", "_squadDict"];

    while {true} do
    {
        while {!(isNull _group)} do
        {
            _groupId = groupId _group;
            _side = side _group;
            _colour = SQUAD_COLOUR(_group);
            _icon = SQUAD_ICON(_group);
            _visible = SQUAD_VISIBLE(_group);
            _specialists = SQUAD_SPECIALISTS(_group);

            _squadDict set ["name", _groupId];
            _squadDict set ["side", _side];
            _squadDict set ["colour", _colour];
            _squadDict set ["icon", _icon];
            _squadDict set ["visible", _visible];
            _squadDict set ["specialists", _specialists];

            sleep 5;

        };

        _groupId =     _squadDict getOrDefault ["name", ""];
        _side =        _squadDict getOrDefault ["side", sideUnknown];
        _colour =      _squadDict getOrDefault ["colour", COLOUR_DEFAULT];
        _icon =        _squadDict getOrDefault ["icon", ""];
        _visible =     _squadDict getOrDefault ["visible", true];
        _specialists = _squadDict getOrDefault ["specialists", []];

        if (_side isEqualTo sideUnknown) exitWith
        {
            DEBUG_FORMAT1_LOG("[SquadMarkers]: Failed to recreate group %1 due to unknown side.",_groupId)
        };

        _group = createGroup [_side, false];

        if (_groupId isNotEqualTo "") then
        {
            _group setGroupIdGlobal [_groupId];
        };

        SET_SQUAD_VAL_DIRECT(_group,Important,true);
        SET_SQUAD_COLOUR_DIRECT(_group,_colour);
        SET_SQUAD_ICON_DIRECT(_group,_icon);
        SET_SQUAD_VISIBILITY_DIRECT(_group,_visible);
        SET_SQUAD_SPECIALISTS_DIRECT(_group,_specialists);

    };

};
