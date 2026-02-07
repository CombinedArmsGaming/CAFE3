#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting squad markers")

#ifdef ENABLE_SQUAD_MARKERS

f_var_hideSquadMarkers = false;

#else

f_var_hideSquadMarkers = true;

#endif

[] call f_fnc_beginSquadMarkers;