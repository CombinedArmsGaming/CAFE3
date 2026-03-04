// CAFE - Caching Script Tracker
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================

#include "macros.hpp"

_range = f_param_caching;

{

    if !(isNull _x) then
    {
        _exclude = _x getvariable ["f_cacheExcl", false];

        if (!_exclude) then
        {
            _cached = _x getvariable ["f_cached", false];

            if (_cached) then
            {
                _leader = leader _x;

                if (isNull _leader or {!(alive _leader)}) then
                {
                    _units = units _x;
                    _unitIdx = _units findIf {alive _x};
                    _leader = if (_unitIdx < 0) then {objNull} else {_units select _unitIdx};
                };

                if !(isNull _leader or {!(alive _leader)}) then
                {
                    _isNearEnough = [_leader, _range] call f_fnc_nearPlayerCluster;

                    if (_isNearEnough) then
                    {
                        DEBUG_FORMAT1_CHAT("f_fnc_cache DBG: Decaching: %1",_x);

                        _x spawn f_fnc_uncacheGroup;

                    };

                };

            }
            else
            {
                // TODO :: DRY, copied for optimisation.
                _leader = leader _x;

                if (isNull _leader or {!(alive _leader)}) then
                {
                    _units = units _x;
                    _unitIdx = _units findIf {alive _x};
                    _leader = if (_unitIdx < 0) then {objNull} else {_units select _unitIdx};
                };

                if !(isNull _leader or {!(alive _leader)}) then
                {
                    _isNearEnough = [_leader, _range] call f_fnc_nearPlayerCluster;

                    if !(_isNearEnough) then
                    {
                        DEBUG_FORMAT1_CHAT("f_fnc_cache DBG: Caching: %1",_x);

                        [_x] spawn f_fnc_cacheGroup;

                    };

                };

            };

        };

    };

} foreach allGroups;
