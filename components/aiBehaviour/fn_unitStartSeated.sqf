#include "macros.hpp"

params ["_unit", "_seat"];

LOCAL_ONLY(_unit);
RUN_AS_ASYNC(f_fnc_unitStartSeated);

WAIT_UNTIL_MISSION_STARTED();

[_seat, _unit] call acex_sitting_fnc_sit;
