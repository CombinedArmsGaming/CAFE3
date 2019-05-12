// F3 - Caching Script Group Cacher
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================


#include "macros.hpp"

params [["_group", grpNull], ["_aggressiveness", f_var_cachingAggressiveness]];

_group setvariable ["f_cached", false];

{

  // Disable simulation based on aggressiveness
    switch (_aggressiveness) do
    {

        case AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS:
        {
            _role = assignedVehicleRole _x;

            if ((_x != leader _group) and {count _role == 0 or {"Driver" != _role select 0}}) then
            {
                _x enableSimulationGlobal false;
            };

        };

        case AI_CACHE_EXCEPT_CREW:
        {
            _role = assignedVehicleRole _x;

            if !(count _role > 0 and {"Cargo" != _role select 0}) then
            {
                _x enableSimulationGlobal false;
            };

        };

        case AI_CACHE_EXCEPT_LEADERS_AND_CREW:
        {
            _role = assignedVehicleRole _x;

            if ((_x != leader _group) and {!(count _role > 0 and {"Cargo" != _role select 0})}) then
            {
                _x enableSimulationGlobal false;
            };

        };

        case AI_CACHE_EXCEPT_DRIVERS:
        {
            _role = assignedVehicleRole _x;

            if (count _role == 0 || {"Driver" != _role select 0}) then
            {
                _x enableSimulationGlobal false;
            };

        };

        case AI_CACHE_ALL:
        {
            _x enableSimulationGlobal false;
        };

        default
        {
            DEBUG_FORMAT1_LOG("f_fnc_cacheGroup DBG: f_var_cachingAggressiveness is not an accepted value: %1",f_var_cachingAggressiveness)
        };

    };


    // All unit's are hidden
    _x hideObjectGlobal true;

    if (_aggressiveness == 3) then
    {
        if (vehicle _x != _x) then
        {
            (vehicle _x) hideObjectGlobal true
        };

    };


    sleep 0.1;

} forEach units _group;


true
