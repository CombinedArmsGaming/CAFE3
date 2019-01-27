
#include "macros.hpp"


f_arr_playerGroups = [];

while {true} do
{
    _groups = allGroups;

    _newArray = [];

    {
        scopeName "sqfSucks_groupLoop";
        _group = _x;

        {
            _unit = _x;

            if (isPlayer _unit) then
            {
                _newArray pushBack _group;
                breakTo "sqfSucks_groupLoop";
            };

        } forEach units _group;

    } forEach _groups;

    f_arr_playerGroups = _newArray;

    //DEBUG_FORMAT1_LOG("Player groups: %1",str f_arr_playerGroups)

    sleep 5;

};
