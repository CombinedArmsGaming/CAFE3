#include "macros.hpp"

DEBUG_PRINT_LOG("initting squad markers")

f_var_hideSquadMarkers = false;

CLIENT_ONLY;


#ifdef ENABLE_SQUAD_MARKERS

[] spawn f_fnc_aceSquadMarkerMenuAction;
[] call f_fnc_beginSquadMarkers;

#else

if (true) exitWith { DEBUG_PRINT_LOG("[SquadMarkers] init_component was called but ENABLE_SQUAD_MARKERS is not set.") };

#endif
