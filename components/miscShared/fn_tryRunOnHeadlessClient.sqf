#include "macros.hpp"

params ["_funcStr", "_args"];

if !(hasInterface or isServer) exitWith {false};

_hcIds = missionNamespace getVariable ["f_var_hc_ids", []];

if (count _hcIds <= 0) exitWith
{
    _args remoteExec [_funcStr, 2];
    true
};

_hcCounts = _hcIds apply
{
    _hcTrackingVar = format ["f_var_hc_%1_groupCount", _x];
    missionNamespace getVariable [_hcTrackingVar, 0]
};

_selectHc = _hcCounts find (selectMin _hcCounts);
_hcId = _hcIds select _selectHc;

_args remoteExec [_funcStr, _hcId];
true
