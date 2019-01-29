#include "macros.hpp"

params ["_report"];

RUN_ON_SERVER(f_fnc_appendKillReport,_this);

_killTracking = missionNamespace getVariable [FULL_KILL_LOG_KEY_SERVER, []];

_killTracking pushBack _report;


DEBUG_FORMAT1_LOG("[TrackKills] Adding to log: %1",_report)

missionNamespace setVariable [FULL_KILL_LOG_KEY_SERVER, _killTracking];
