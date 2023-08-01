#include "macros.hpp"

disableSerialization;

private _widgetCtrlGroup = uiNamespace getVariable ["f_downtimeWidget_ctrlGroup", controlNull];

if ((isNull _widgetCtrlGroup) or {!ctrlShown _widgetCtrlGroup}) exitWith {};

createDialog "CAFE_SpawnPicker_Dialog";