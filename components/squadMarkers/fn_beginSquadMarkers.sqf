
#include "macros.hpp"

WAIT_UNTIL_SETTINGS_READY();
WAIT_UNTIL_PLAYER_EXISTS();

[] spawn f_fnc_initSquadMarkerManager;
[] spawn f_fnc_squadMarkerArtilleryComputerManager;

if IS_TRUE(f_var_enableMicroDAGRSquadMarkers) then {

    if !(isNil 'ace_microDAGR_miniMapDrawHandlers') then
    {
        ace_microDAGR_miniMapDrawHandlers pushBack f_fnc_drawSquadMarkers;
    };

};
