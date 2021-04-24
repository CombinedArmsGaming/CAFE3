#include "macros.hpp"

CLIENT_ONLY;

// 'Classic' situation info display.
// Credits: PabstMirror, edited by Bubbus
[] spawn
{
    waitUntil { player == player };
    waitUntil { time > 0 };
    waitUntil { speed player > 1 };

    _msg = (getPos player) call BIS_fnc_locationDescription;
    _msg = _msg + format ["<br/>%4%5/%2%3/%1", date select 0, ["", "0"] select (date select 1 < 10), date select 1, ["", "0"] select (date select 2 < 10), date select 2];
    _msg = _msg + format ["<br/>%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];

    [
        _msg,
        [safezoneX + safezoneW - 0.8, 0.50],
        [safezoneY + safezoneH - 0.8, 0.7],
        5,
        0.5
    ] spawn BIS_fnc_dynamicText;

};
