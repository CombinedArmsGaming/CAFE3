#include "../macros.hpp"
#define SQUARE_POLL_RATE 5

params ["_position", "_object"];
DEBUG_PRINT_LOG("[RESPAWN_ZEN] Creating square for random player");
[_position, "RANDOM"] call f_fnc_doRespawnSquare;