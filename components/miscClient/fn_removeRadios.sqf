#include "macros.hpp"

CLIENT_ONLY;

waitUntil { [] call acre_api_fnc_isInitialized };

_radios = [player] call acre_sys_core_fnc_getGear;

{
    _unit removeItem _x;

} forEach _radios;
