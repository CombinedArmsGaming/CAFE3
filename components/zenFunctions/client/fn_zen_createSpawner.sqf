#include "macros.hpp"

params ["_position", ["_side", west]];

systemChat "This spawner will become active in 15 seconds.  Fine tune its position if needed.";
[_position, _side] remoteExec ["f_fnc_zen_createPlayerSpawner", 2];
