// Used to toggle "active" state of the zeus player.
// If true, player is able to move, is visible and is targeted by AI.
// If false, the opposite of all those applies.

#include "macros.hpp"

RUN_ON_SERVER(f_fnc_activatePlayer,_this);

params ["_unit", "_active"];

_unit enableSimulationGlobal _active;
_unit hideObjectGlobal !_active;
