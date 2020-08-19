#include "macros.hpp"

SERVER_ONLY;

f_arr_headlessClients = [];

waitUntil
{
    // Get all HC owner IDs.  Disconnected HCs will have owner IDs of 0 or 2.
    _hcEnts = (entities "HeadlessClient_F");
    _hcIds = (_hcEnts apply {owner _x}) select {!(_x in [0, 2])};

    // A HC which is not yet ingame will not be in allPlayers, and cannot yet be used.  We filter those out here.
    _playerOwners = allPlayers apply {owner _x};
    _hcIds = _hcIds arrayIntersect _playerOwners;

    // For now, we balance HC usage by group.  We create an array of groups per owner.
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
