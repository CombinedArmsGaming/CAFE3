#include "macros.hpp"

params ["_logDiff", "_newCount", "_unit"];

_killTracking = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];

_killTracking = _killTracking append _logDiff;

profileNamespace setVariable [_fullKeyName, _killTracking];

_unit setVariable ["f_var_killLogLastSize", _newCount, true];
