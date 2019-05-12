
#include "macros.hpp"

SERVER_ONLY;


f_arr_aiCaching_playerClusters = [];
f_arr_aiCaching_playerClustersTemp = [];
f_var_aiCaching_clusterRadius = 50;


_isPointWithinCluster =
{
    params ["_point", "_cluster"];

    _centroid = _cluster select 0;
    // TODO :: Ensure distance2D is valid for vectors.
    _distance = _centroid distance2D _point;

    (_distance <= f_var_aiCaching_clusterRadius)

};



_addPlayerToCluster =
{
    params ["_ply", "_cluster"];

    _centroid = _cluster select 0;
    _playerList = _cluster select 1;

    _playerList pushBack _ply;
    _x setVariable ["f_var_aiCaching_cluster", _cluster];

    _count = count _playerList;

    // TODO :: confirm additive centroid algo works.
    _centroid = (_centroid vectorMultiply (_count-1 / _count)) vectorAdd (getPos _ply vectorMultiply (1 / _count));

    _cluster set [0, _centroid];

};



_createVehicleCluster =
{
    params ["_ply"];

    _cluster = [[0,0,0], [], true];

    _vehicle = vehicle _ply;
    // TODO :: Use method that captures all units in crew AND cargo.
    _crew = crew _vehicle;

    {
        [_x, _cluster] call _addPlayerToCluster;
    } forEach _crew;

    _cluster

}



_clusterThisPlayer =
{
    params ["_ply"];

    if (vehicle _ply != _ply) exitWith
    {
        [_ply] call _createVehicleCluster
    }

    _pos = getPos _ply;

    _cluster =
    {
        if ([_pos, _x] call _isPointWithinCluster) exitWith { _x };
    } forEach f_arr_aiCaching_playerClustersTemp;

    if (isNil '_cluster' or {isNull _cluster}) then
    {
        _cluster = [[0,0,0], [], false];
        f_arr_aiCaching_playerClustersTemp pushBack _cluster;
    };

    [_ply, _cluster] call _addPlayerToCluster;

    _cluster

};



_createPlayerClusters =
{
    _agenda = allPlayers;
    f_arr_aiCaching_playerClustersTemp = [];

    {
        _x setVariable ["f_var_aiCaching_cluster", []];
    } forEach _agenda;

    {
        _playerCluster = _x getVariable ["f_var_aiCaching_cluster", []];

        if !(_playerCluster isEqualTo [])
        {
            [_x] call _clusterThisPlayer;
        };

    } forEach _agenda;

    f_arr_aiCaching_playerClusters = f_arr_aiCaching_playerClustersTemp;

};



[] spawn
{
    waitUntil
    {
        [] call _createPlayerClusters;
        sleep 5;
    };

};
