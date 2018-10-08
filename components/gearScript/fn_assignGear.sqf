#include "macros.hpp"

// Run the loop only on the server
params ["_loadout", "_unit", "_faction"];

_unit setVariable ["f_var_assignGear", _loadout];
