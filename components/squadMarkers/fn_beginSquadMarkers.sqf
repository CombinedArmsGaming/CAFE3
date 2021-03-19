
#include "macros.hpp"

WAIT_UNTIL_SETTINGS_READY();
WAIT_UNTIL_PLAYER_EXISTS();

[] spawn f_fnc_initSquadMarkerManager;
[] spawn f_fnc_squadMarkerArtilleryComputerManager;

#ifdef ENABLE_MICRODAGR_SQUADMARKERS

    if !(isNil 'ace_microDAGR_miniMapDrawHandlers') then
    {
        ace_microDAGR_miniMapDrawHandlers pushBack f_fnc_drawSquadMarkers;
    };

#endif
