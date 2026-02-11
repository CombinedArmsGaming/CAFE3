#include "macros.hpp"

params ["_display"];

disableSerialization;


_group = _display ctrlCreate ["CAFE_DowntimeControlsGroup", 49690];

uiNamespace setVariable ["f_downtimeWidget_ctrlGroup", _group];

uiNamespace setVariable ["f_downtimeWidget_background", _display displayCtrl 49691];

uiNamespace setVariable ["f_downtimeWidget_youAre", _display displayCtrl 49692];

uiNamespace setVariable ["f_downtimeWidget_downIndicator", _display displayCtrl 49693];

uiNamespace setVariable ["f_downtimeWidget_chooseSpawnButton", _display displayCtrl 49694];

uiNamespace setVariable ["f_downtimeWidget_chooseSpawnButtonText", _display displayCtrl 49695];

[] call f_fnc_spectatorDowntimeWidget_updateLoop;

if (PLAYER_IS_DEAD) then {
	[] call f_fnc_tryShowSpawnpointDialog;
};