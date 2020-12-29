
_netId = _this call BIS_fnc_netId;

_parts = _netId splitString ":";

parseNumber (_parts#1)
