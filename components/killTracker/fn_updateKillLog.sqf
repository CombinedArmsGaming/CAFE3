#include "macros.hpp"

params ["_logDiff", "_newCount", "_unit"];

_killTracking = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];
_killTracking append _logDiff;

profileNamespace setVariable [FULL_KILL_LOG_KEY_CLIENT, _killTracking];

_unit setVariable ["f_var_killLogLastSize", _newCount, true];
