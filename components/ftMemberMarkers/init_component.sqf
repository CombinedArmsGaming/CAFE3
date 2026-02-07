#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting fireteam member markers")

#ifdef ENABLE_FIRETEAM_MARKERS

f_var_hideFTMarkers = false;

#else

f_var_hideFTMarkers = true;

#endif