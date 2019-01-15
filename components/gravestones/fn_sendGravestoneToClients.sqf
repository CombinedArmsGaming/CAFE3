#include "macros.hpp"

DEBUG_FORMAT1_LOG("[Gravestones] Sending %1 to clients.",_this)

_targets = if (isServer and hasInterface) then {0} else {-2};

_this remoteExec ["f_fnc_addActionToGravestone", _targets, true];
