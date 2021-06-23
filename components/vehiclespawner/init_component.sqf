#include "macros.hpp"

CLIENT_ONLY;

_code = {[_this#1] call f_fnc_setVehicleSpawnNo};

["[CA2] Misc", "Set Vehiclespawner Reserve", _code] call zen_custom_modules_fnc_register;
    

