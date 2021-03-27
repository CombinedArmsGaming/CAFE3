#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting squad markers")

#ifdef ENABLE_SQUAD_MARKERS

[] call f_fnc_beginSquadMarkers;

#else

if (true) exitWith { DEBUG_PRINT_LOG("[SquadMarkers] init_component was called but ENABLE_SQUAD_MARKERS is not set.") };

#endif
