// F3 - Caching Script Tracker
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

// DECLARE VARIABLES AND FUNCTIONS
params ["_range"];

_groups = [];

// ====================================================================================

// BEGIN THE TRACKING LOOP
while {f_var_cacheRun} do
{
    _groups = allGroups;

    {

        if (!(isNull _x or {isNull leader _x}) ) then
        {
            _exclude = _x getvariable ["f_cacheExcl",false];

            if (!_exclude) then
            {
                _isNearEnough = [leader _x, _range] call f_fnc_nearPlayerGroup;

                _cached = _x getvariable ["f_cached", false];

                if (_cached) then
                {
                    if (_isNearEnough) then
                    {
                        DEBUG_FORMAT1_CHAT("f_fnc_cache DBG: Decaching: %1",_x);

                        _x setvariable ["f_cached", false];
                        _x spawn f_fnc_uncacheGroup;

                    };

                }
                else
                {
                    if !(_isNearEnough) then
                    {
                        if ((units _x) findIf {isPlayer _x} >= 0) then
                        {
                            f_arr_aiCaching_playerGroups pushBack _x;
                        }
                        else
                        {
                            DEBUG_FORMAT1_CHAT("f_fnc_cache DBG: Caching: %1",_x);

                            _x setvariable ["f_cached", true];
                            [_x] spawn f_fnc_cacheGroup;

                        };

                    };

                };


            };

        };

    } foreach _groups;

    sleep f_var_cacheSleep;

};

// If the caching loop is terminated, uncache all cached groups
{
    if (_x getvariable ["f_cached", false]) then
    {
        _x spawn f_fnc_uncacheGroup;
        _x setvariable ["f_cached", false];
    };

} forEach allGroups;
