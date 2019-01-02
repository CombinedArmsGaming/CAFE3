
#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting client misc")

[] spawn f_fnc_pmMissionIntro;

[] spawn
{
    while {true} do
    {
        [player, 7500] call f_fnc_setRating;
        sleep 5;
    };

};

[] spawn
{
    waitUntil {uiSleep 1; !isNil "f_radios_loadedSettings"};

    _side = switch (side player) do
    {
        case west: { "blufor" };
        case east: { "opfor" };
        case independent: { "indfor" };
        default { "indfor" };
    };

    if !(_side == "") then
    {
        [_side] call f_fnc_generateRadioList;
    }

};
