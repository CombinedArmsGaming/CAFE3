#include "macros.hpp"

RUN_ON_SERVER(f_fnc_transmitLogDiff,_this);

params ["_logDiff", "_recipient", "_newCount"];

DEBUG_FORMAT2_LOG("[TrackKills] Sending %1 log entries to %2.",(count _logDiff),_recipient);

[_logDiff, _newCount, _recipient] remoteExec ["f_fnc_updateKillLog", _recipient];
