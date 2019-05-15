
#include "macros.hpp"

SERVER_ONLY;

_clusterMarks = missionNamespace getVariable ["f_arr_clusterMarks", []];

{
    deleteMarker _x;
} forEach _clusterMarks;

_clusterMarks = [];


{
    _clusterIdx = _forEachIndex;

    _centroid = _x select 0;
    _vehicle = _x select 2;

    if !(isNull _vehicle) then
    {
        _centroid = getPos _vehicle;
    };

    _name = format ["Mkr%1_Ct", _clusterIdx];
    _marker = createMarker [_name, _centroid];
    _marker setMarkerType "mil_destroy";
    _marker setMarkerText format ["Cl %1", _clusterIdx];

    _clusterMarks pushBack _name;

    {
        _name = format ["Mkr%1_%2", _clusterIdx, _forEachIndex];
        _marker = createMarker [_name, getPos _x];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText format ["Cl %1", _clusterIdx];

        _clusterMarks pushBack _name;

    } forEach (_x select 1);

} forEach f_arr_aiCaching_playerClusters;

missionNamespace setVariable ["f_arr_clusterMarks", _clusterMarks];
