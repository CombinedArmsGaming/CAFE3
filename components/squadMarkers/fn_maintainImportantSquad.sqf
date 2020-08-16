#include "macros.hpp"

SERVER_ONLY;

params ["_group"];

WAIT_UNTIL_MISSION_STARTED;

if !EXISTS(_group) exitWith
{
    DEBUG_PRINT_CHAT("Tried to register an important squad that does not exist.")
};

DICT_CREATE(_squadDict);

//missionNamespace setVariable [SQUAD_STATE_BACKUP_NAME(_groupId), _squadDict];

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

            DICT_SET(_squadDict,"name",_groupId);
            DICT_SET(_squadDict,"side",_side);
            DICT_SET(_squadDict,"colour",_colour);
            DICT_SET(_squadDict,"icon",_icon);
            DICT_SET(_squadDict,"visible",_visible);
            DICT_SET(_squadDict,"specialists",_specialists);

            sleep 5;

        };

        _groupId = DICT_GET(_squadDict,"name");
        _side = DICT_GET(_squadDict,"side");
        _colour = DICT_GET(_squadDict,"colour");
        _icon = DICT_GET(_squadDict,"icon");
        _visible = DICT_GET(_squadDict,"visible");
        _specialists = DICT_GET(_squadDict,"specialists");

        _group = createGroup [_side, false];
        _group setGroupIdGlobal [_groupId];
        SET_SQUAD_VAL_DIRECT(_group,Important,true);
        SET_SQUAD_COLOUR_DIRECT(_group,_colour);
        SET_SQUAD_ICON_DIRECT(_group,_icon);
        SET_SQUAD_VISIBILITY_DIRECT(_group,_visible);
        SET_SQUAD_SPECIALISTS_DIRECT(_group,_specialists);

    };

};
