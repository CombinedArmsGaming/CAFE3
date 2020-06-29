#include "macros.hpp"

DEBUG_PRINT_LOG("initting view distance editor")

f_var_viewDistanceEditor_terainDetailChoices =
[
#ifdef ENABLE_LOWEST_TERRAIN_DETAIL
    "Lowest (no grass)",
#endif
    "Low (MP default)",
    "Normal (SP default)",
    "High",
    "Ultra"
];


f_var_viewDistanceEditor_terainDetailValues =
[
#ifdef ENABLE_LOWEST_TERRAIN_DETAIL
    50,
#endif
    25,
    12.5,
    6.25,
    3.125
];
