#include "macros.hpp"

params ["_logDiff", "_newCount", "_unit"];

_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];


if (isNil 'f_var_currentKillLogIndex') then
{
    f_var_currentKillLogIndex = count _killLogs;
};


if (count _killLogs <= f_var_currentKillLogIndex) then
{
    _killLogs set [f_var_currentKillLogIndex, []];
};


_killTracking = _killLogs select f_var_currentKillLogIndex;
_killTracking append _logDiff;

DEBUG_FORMAT2_LOG("[TrackKills] Appended %1 entries to log index %2.",count _logDiff,f_var_currentKillLogIndex)

profileNamespace setVariable [FULL_KILL_LOG_KEY_CLIENT, _killLogs];

_unit setVariable ["f_var_killLogLastSize", _newCount, true];
