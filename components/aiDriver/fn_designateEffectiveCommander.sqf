#include "macros.hpp"

params ["_vehicle", "_commander"];

[_vehicle, _commander] remoteExec ["setEffectiveCommander", 0];
