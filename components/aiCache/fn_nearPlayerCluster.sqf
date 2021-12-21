// CAFE - Near Player Group Function
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================

#include "macros.hpp"

params ["_unit", "_distance"];

_clusters = missionNamespace getVariable ["f_arr_aiCaching_playerClusters", []];
if (_clusters isEqualTo []) exitWith { false };

_closeEnough = false;

{
    _vehicle = _x select 2;
    _centroid = _x select 0;

    if !(isNull _vehicle) then
    {
        _centroid = getPos _vehicle;
    };


    _distance2D = _centroid distance2D (getPos _unit);

    if (_distance2D < _distance) exitWith
    {
        _closeEnough = true;
    };

} forEach _clusters;

_closeEnough
