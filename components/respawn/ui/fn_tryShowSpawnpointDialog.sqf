#include "macros.hpp"

disableSerialization;

private _widgetCtrlGroup = uiNamespace getVariable ["f_downtimeWidget_ctrlGroup", controlNull];

if ((isNull _widgetCtrlGroup) or {!ctrlShown _widgetCtrlGroup}) exitWith {systemChat "ded lol"};

systemChat "hi m8";