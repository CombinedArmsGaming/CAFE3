#include "macros.hpp"

disableSerialization;

if (missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false]) exitWith {};

private _widgetCtrlGroup = uiNamespace getVariable ["f_downtimeWidget_ctrlGroup", controlNull];

if ((isNull _widgetCtrlGroup) or {!ctrlShown _widgetCtrlGroup}) exitWith {};

createDialog "CAFE_SpawnPicker_Dialog";