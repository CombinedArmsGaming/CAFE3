#include "macros.hpp"

// Prune any deleted or killed anchors from the anchors array.

SERVER_ONLY;

private _anchors = missionNamespace getVariable ["f_var_aiCaching_anchors", []];

_anchors = _anchors select {alive _x};

missionNamespace setVariable ["f_var_aiCaching_anchors", _anchors];

if (f_param_caching == 0) exitWith {};
[f_fnc_maintainAiCachingAnchorsArray, nil, f_var_cacheSleep] call CBA_fnc_waitAndExecute;
