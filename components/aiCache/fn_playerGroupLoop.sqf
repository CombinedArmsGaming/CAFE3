
#include "macros.hpp"


f_arr_aiCaching_playerGroups = [];
f_arr_aiCaching_awayPlayers = [];

f_fnc_getPlayersAwayFromGroup =
{
    params ["_groups"];

    _awayTolerance = 100;

    _awayPlayers = [];

    {
        _leader = leader _x;

        _awayUnits = (units _x) select {(isPlayer _x) and {_leader distance2D _x > _awayTolerance}};

        _awayPlayers append _awayUnits;

    } forEach _groups;

    _awayPlayers
};


[] spawn
{
    waitUntil
    {
        _groups = allGroups;
        _newArray = [];

        {
            _group = _x;

            {
                if (isPlayer _x) exitWith
                {
                    _newArray pushBack _group;
                };

            } forEach units _x;

        } forEach _groups;

        _awayPlayers = [_newArray] call f_fnc_getPlayersAwayFromGroup;
        f_arr_aiCaching_playerGroups = _newArray;
        f_arr_aiCaching_awayPlayers = _awayPlayers;

        sleep 30;

    };

};


[] spawn
{
    waitUntil
    {
        f_arr_aiCaching_awayPlayers = [f_arr_aiCaching_playerGroups] call f_fnc_getPlayersAwayFromGroup;

        sleep 6;

    };

};
