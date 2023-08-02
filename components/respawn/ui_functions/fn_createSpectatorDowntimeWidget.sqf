#include "macros.hpp"

params ["_display"];

disableSerialization;

private _idc = 49690;

private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", _idc]; _idc = _idc + 1;
_ctrlGroup ctrlSetPosition 
[
    (safeZoneW + safeZoneX) - (safeZoneW * 0.25),
    safeZoneY + (safeZoneH * 0.00),
    safeZoneW * 0.25,
    safeZoneH * 0.07
];
_ctrlGroup ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_ctrlGroup", _ctrlGroup];


private _background = _display ctrlCreate ["CAFE_DefaultText", _idc, _ctrlGroup]; _idc = _idc + 1;
_background ctrlSetPosition 
[
    0,
    0,
    safeZoneW * 0.25,
    safeZoneH * 0.07
];
_background ctrlSetBackgroundColor [0, 0, 0, 0.5];
_background ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_background", _background];


private _youAre = _display ctrlCreate ["CAFE_DefaultText", _idc, _ctrlGroup]; _idc = _idc + 1;
_youAre ctrlSetPosition 
[
    safeZoneW * 0.002,
    safeZoneH * 0.005,
    safeZoneW * 0.05,
    safeZoneH * 0.02
];
_youAre ctrlSetText "You are";
_youAre ctrlSetFont "RobotoCondensed";
_youAre ctrlSetFontHeight 0.03;
_youAre ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_youAre", _youAre];


private _downIndicator = _display ctrlCreate ["CAFE_DefaultText", _idc, _ctrlGroup]; _idc = _idc + 1;
_downIndicator ctrlSetPosition 
[
    0,
    safeZoneH * 0.015,
    safeZoneW * 0.1,
    safeZoneH * 0.05
];
_downIndicator ctrlSetText "DEAD";
_downIndicator ctrlSetTextColor [1, 0.7, 0.7, 1];
_downIndicator ctrlSetFont "PuristaBold";
_downIndicator ctrlSetFontHeight 0.075;
_downIndicator ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_downIndicator", _downIndicator];


private _chooseSpawnButton = _display ctrlCreate ["CAFE_DefaultButton", _idc, _ctrlGroup]; _idc = _idc + 1;
_chooseSpawnButton ctrlSetPosition 
[
    safeZoneW * 0.08,
    safeZoneH * 0.01,
    safeZoneW * 0.165,
    safeZoneH * 0.035
];
_chooseSpawnButton ctrlSetBackgroundColor [0.65, 0.39, 0.05, 1];
_chooseSpawnButton ctrlAddEventHandler ["ButtonClick", {[] call f_fnc_tryShowSpawnpointDialog}];
_chooseSpawnButton ctrlSetText "CHOOSE SPAWN LOCATION";
_chooseSpawnButton ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_chooseSpawnButton", _chooseSpawnButton];


private _chooseSpawnButtonText = _display ctrlCreate ["CAFE_CenteredText", _idc, _ctrlGroup]; _idc = _idc + 1;
_chooseSpawnButtonText ctrlSetPosition 
[
    safeZoneW * 0.08,
    safeZoneH * 0.047,
    safeZoneW * 0.165,
    safeZoneH * 0.02
];
_chooseSpawnButtonText ctrlSetText "(Or press CTRL + S !)";
_chooseSpawnButtonText ctrlSetFontHeight 0.03;
_chooseSpawnButtonText ctrlCommit 0;
uiNamespace setVariable ["f_downtimeWidget_chooseSpawnButtonText", _chooseSpawnButtonText];


[] call f_fnc_spectatorDowntimeWidget_updateLoop;