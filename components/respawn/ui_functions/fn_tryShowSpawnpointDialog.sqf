#include "macros.hpp"

disableSerialization;

if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) exitWith {};

private _widgetCtrlGroup = uiNamespace getVariable ["f_downtimeWidget_ctrlGroup", controlNull];

if ((isNull _widgetCtrlGroup) or {!ctrlShown _widgetCtrlGroup}) exitWith {};

if (missionNamespace getVariable ["f_var_spawnPickerDialog_lockedOut", false]) exitWith {DEBUG_PRINT_LOG("[RESPAWN] Denied opening of spawn picker dialog due to lockout")};

#ifdef ENABLE_RESPAWN_DIALOG
createDialog ["CAFE_SpawnPicker_Dialog", true];
#endif