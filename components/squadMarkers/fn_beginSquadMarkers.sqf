
#include "macros.hpp"

WAIT_UNTIL_SETTINGS_READY();
WAIT_UNTIL_PLAYER_EXISTS();

[] call f_fnc_initSquadMarkerManager;
[] spawn f_fnc_squadMarkerArtilleryComputerManager;
