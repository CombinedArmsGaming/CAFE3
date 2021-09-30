
#include "macros.hpp"

SERVER_ONLY;


if (isNil "f_arr_aiCaching_playerClusters") then
{
    f_arr_aiCaching_playerClusters = [];
};

if (isNil "f_arr_aiCaching_playerClustersTemp") then
{
    f_arr_aiCaching_playerClustersTemp = [];
};


_getPlayerAgenda =
{
    private _agenda = allPlayers;

    if !(missionNamespace getVariable ["f_var_uncacheNearZeus", true]) then
    {
        _agenda = _agenda select {!(_x getVariable ["f_var_isZeus", false])};
    };

    _agenda

};


_isPointWithinCluster =
{
    params ["_point", "_cluster"];

    private _centroid = _cluster select 0;
    private _distance = _centroid distance2D _point;

    (_distance <= f_var_aiCaching_clusterRadius)

};



_addPlayerToCluster =
{
    params ["_ply", "_cluster"];

    private _centroid = _cluster select 0;
    private _playerList = _cluster select 1;

    _playerList pushBack _ply;
    _ply setVariable ["f_var_aiCaching_cluster", _cluster];

    private _count = count _playerList;

    _centroid = (_centroid vectorMultiply ((_count-1) / _count)) vectorAdd ((getPos _ply) vectorMultiply (1 / _count));

    _cluster set [0, _centroid];

};



_createVehicleCluster =
{
    params ["_ply"];

    private _vehicle = vehicle _ply;
    private _cluster = [[0,0,0], [], _vehicle];

    private _crew = crew _vehicle;

    {
        [_x, _cluster] call _addPlayerToCluster;
    } forEach _crew;

    _cluster

};



_clusterThisPlayer =
{
    params ["_ply"];

    if (vehicle _ply != _ply) exitWith
    {
        private _cluster = [_ply] call _createVehicleCluster;
		f_arr_aiCaching_playerClustersTemp pushBack _cluster;

		_cluster
    };

    private _pos = getPos _ply;

    private _cluster =
    {
        if ([_pos, _x] call _isPointWithinCluster) exitWith { _x };
    } forEach f_arr_aiCaching_playerClustersTemp;

    if (isNil '_cluster') then
    {
        _cluster = [[0,0,0], [], objNull];
        f_arr_aiCaching_playerClustersTemp pushBack _cluster;
    };

    [_ply, _cluster] call _addPlayerToCluster;

    _cluster

};



f_arr_aiCaching_playerClustersTemp = [];

private _agenda = [] call _getPlayerAgenda;

{
    _x setVariable ["f_var_aiCaching_cluster", []];
} forEach _agenda;

{
    private _playerCluster = _x getVariable ["f_var_aiCaching_cluster", []];

    if (_playerCluster isEqualTo []) then
    {
        [_x] call _clusterThisPlayer;
    };

} forEach _agenda;

if (missionNamespace getVariable ["f_var_uncacheNearDrones", false]) then
{
    private _agenda = allUnitsUAV select {isUAVConnected _x};

    {
        private _cluster = [_x] call _createVehicleCluster;
		f_arr_aiCaching_playerClustersTemp pushBack _cluster;

    } forEach _agenda;

};

private _anchors = missionNamespace getVariable ["f_var_aiCaching_anchors", []];

{
    f_arr_aiCaching_playerClustersTemp pushBack [[0,0,0], [], _x];

} forEach _anchors;

f_arr_aiCaching_playerClusters = f_arr_aiCaching_playerClustersTemp;
