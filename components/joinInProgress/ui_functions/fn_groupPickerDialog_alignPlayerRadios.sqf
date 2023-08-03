#include "macros.hpp"

params ["_doGearscript", "_group"];

if (_doGearscript) then
{
    DEBUG_FORMAT1_LOG("[GroupPicker] Forcing Re-gearscript for %1",(str player));
    [player] call f_fnc_reapplyGear;
}
else
{
    ["", player] call f_fnc_configureUnitRadios;
};