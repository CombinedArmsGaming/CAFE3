#include "macros.hpp"

SERVER_ONLY;

params ["_position"];

private _anchor = "Sign_Arrow_Large_Pink_F" createVehicle _position;

private _anchors = missionNamespace getVariable ["f_var_aiCaching_anchors", []];
_anchors pushBack _anchor;
missionNamespace setVariable ["f_var_aiCaching_anchors", _anchors];

[_anchor] remoteExec ["f_fnc_applyCachingAnchorVisibility", 0, _anchor];

["Caching Anchor created.  Nearby AI groups will stay un-cached until it is deleted."] call zen_common_fnc_showMessage;
