// F3 - Near Player Group Function
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#include "macros.hpp"

params ["_unit", "_distance"];

_clusters = missionNamespace getVariable ["f_arr_aiCaching_playerClusters", []];
if (_clusters isEqualTo []) exitWith { false };

_closeEnough = false;

{
    _centroid = _x select 0;
    // TODO :: Ensure distance2D is valid for vectors.
    _distance2D = _centroid distance2D (getPos _unit);

    if (_distance2D < _distance) exitWith
    {
        _closeEnough = true;
    };

} forEach _clusters;

_closeEnough
