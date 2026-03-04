// CAFE - Caching Script Group Cacher
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================


#include "macros.hpp"

params [["_group", grpNull], ["_aggressiveness", f_var_cachingAggressiveness]];

_group setVariable ["f_cached", true, true];

{
    _leader = leader _group;

  // Disable simulation based on aggressiveness
    switch (_aggressiveness) do
    {

        case AI_CACHE_EXCEPT_LEADERS_AND_DRIVERS:
        {
            _role = assignedVehicleRole _x;
            _isLeader = _x isEqualTo _leader;
            _isDriver = (count _role > 0) and {"Driver" isEqualTo (_role select 0)};

            if !(_isLeader or _isDriver) then
            {
                _x enableSimulationGlobal false;
                _x hideObjectGlobal true;
            };

        };

        case AI_CACHE_EXCEPT_CREW:
        {
            _role = assignedVehicleRole _x;
            _isCrew = (count _role > 0) and {!("Cargo" isEqualTo (_role select 0))};

            if !(_isCrew) then
            {
                _x enableSimulationGlobal false;
                _x hideObjectGlobal true;
            };

        };

        case AI_CACHE_EXCEPT_LEADERS_AND_CREW:
        {
            _role = assignedVehicleRole _x;
            _isLeader = _x isEqualTo _leader;
            _isCrew = (count _role > 0) and {!("Cargo" isEqualTo (_role select 0))};

            if !(_isLeader or _isCrew) then
            {
                _x enableSimulationGlobal false;
                _x hideObjectGlobal true;
            };

        };

        case AI_CACHE_EXCEPT_DRIVERS:
        {
            _role = assignedVehicleRole _x;
            _isDriver = (count _role > 0) and {"Driver" isEqualTo (_role select 0)};

            if !(_isDriver) then
            {
                _x enableSimulationGlobal false;
                _x hideObjectGlobal true;
            };

        };

        case AI_CACHE_ALL:
        {
            _x enableSimulationGlobal false;
            _x hideObjectGlobal true;
        };

        default
        {
            DEBUG_FORMAT1_LOG("f_fnc_cacheGroup DBG: f_var_cachingAggressiveness is not an accepted value: %1",f_var_cachingAggressiveness)
        };

    };

    sleep 0.1;

} forEach units _group;


true
