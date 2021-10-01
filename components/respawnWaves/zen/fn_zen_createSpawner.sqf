#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", ["_side", west]];

["This spawner will become active in 15 seconds.  Fine tune its position if needed."] call zen_common_fnc_showMessage;
[_position, _side] remoteExec ["f_fnc_zen_createPlayerSpawner", 2];
