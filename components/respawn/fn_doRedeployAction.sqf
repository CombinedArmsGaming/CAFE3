#include "macros.hpp"

if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) exitWith {};

missionNamespace setVariable ["f_var_spawnPickerDialog_ignoreAlive", true];
createDialog "CAFE_SpawnPicker_Dialog";