#include "../macros.hpp"

CLIENT_ONLY;

params ["_position"];

["Caching Anchor created.  Nearby AI groups will stay un-cached until it is deleted."] call zen_common_fnc_showMessage;
[_position] remoteExec ["f_fnc_createAiCachingAnchor", 2];
