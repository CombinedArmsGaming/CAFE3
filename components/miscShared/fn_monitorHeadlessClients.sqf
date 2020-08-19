#include "macros.hpp"

SERVER_ONLY;

f_arr_headlessClients = [];

waitUntil
{
    _hcEnts = (entities "HeadlessClient_F");
    _hcIds = (_hcEnts apply {owner _x}) select {!(_x == 0)};

    _groupOwners = allGroups apply {owner (leader _x)};
    _counts = _groupOwners call BIS_fnc_consolidateArray;

    {
        _ownerId = (_x select 0);

        if (_ownerId in _hcIds) then
        {
            _hcTrackingVar = format ["f_var_hc_%1_groupCount", _ownerId];
            missionNamespace setVariable [_hcTrackingVar, (_x select 1), true];
        };

    } forEach _counts;

    missionNamespace setVariable ["f_var_hc_ids", _hcIds, true];

    sleep 5;

    false

};
