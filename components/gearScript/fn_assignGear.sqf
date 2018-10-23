#include "macros.hpp"

DEBUG_PRINT_LOG("[GEARSCRIPT-2]: Entering assignGear...")


if (canSuspend) then
{
    _this call f_fnc_assignGearWaited;
}
else
{
    _this spawn f_fnc_assignGearWaited;
};
