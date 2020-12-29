#include "macros.hpp"
#include "../../squadmarker_macros.hpp"

params ["_pos", ["_side", west]];

SERVER_ONLY;

_spawner = "VR_Area_01_square_1x1_yellow_F" createVehicle _pos;
_spawner setPosASL _pos;

[_spawner, _side] spawn
{
    params ["_spawner", "_side"];

    sleep 15;

    while {alive _spawner} do
    {
        _group = GET_SQUAD_ON_SIDE_DYNAMIC("Spectators",_side);

        waitUntil
        {
            sleep 5;

            (isNull _group) or {count units _group > 0};
        };

        if !(isNull _group) then
        {
            _unit = selectRandom units _group;
            _unit setVariable ["mySpawner", _spawner, true];

            hideObjectGlobal _spawner;

            sleep 10;

            deleteVehicle _spawner;

            sleep 1;

        };

    };

};

_spawner
