#include "macros.hpp"

SERVER_ONLY;

params ["_position"];

private _anchor = "Sign_Arrow_Large_Pink_F" createVehicle _position;

private _anchors = missionNamespace getVariable ["f_var_aiCaching_anchors", []];
_anchors pushBack _anchor;
missionNamespace setVariable ["f_var_aiCaching_anchors", _anchors];

[_anchor] remoteExec ["f_fnc_applyCachingAnchorVisibility", 0, _anchor];
[_anchor] call f_fnc_addObjectsToAllZeuses;
