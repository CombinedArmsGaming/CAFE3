#include "../../macros.hpp"
#include "../../logi_macros.hpp"

#define GET_VEHICLE_DISPLAY_NAME(VIC_CLASS) (getText (configFile >> "CfgVehicles" >> VIC_CLASS >> "displayName"))
