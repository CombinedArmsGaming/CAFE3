params ["_display", "_control"];

disableSerialization;

private _idc = 48210;


private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", _idc]; _idc = _idc + 1;
_ctrlGroup ctrlSetPosition 
[
    (safeZoneW + safeZoneX) - (safeZoneW * 0.2),
    safeZoneY + (safeZoneH * 0.04),
    safeZoneW * 0.2,
    safeZoneH * 0.853
];
_ctrlGroup ctrlCommit 0;
_ctrlGroup setVariable ["f_var_expanded", true];
uiNamespace setVariable ["f_testCtrlGroup", _ctrlGroup];


private _background = _display ctrlCreate ["CAFE_DefaultText", _idc, _ctrlGroup]; _idc = _idc + 1;
_background ctrlSetPosition 
[
    0,
    0,
    safeZoneW * 0.2,
    safeZoneH * 0.853
];
_background ctrlSetBackgroundColor [0, 0, 0, 0.5];
_background ctrlCommit 0;
uiNamespace setVariable ["f_testCtrl", _background];


private _radiosTable = _display ctrlCreate ["RscTreeSearch", _idc, _ctrlGroup]; _idc = _idc + 1;
_radiosTable ctrlSetFont "EtelkaMonospacePro";
_radiosTable ctrlSetFontHeight 0.03;
_radiosTable ctrlSetBackgroundColor [0, 0, 0, 0];
_radiosTable ctrlSetPosition 
[
    safeZoneW * 0.025,
    safeZoneH * 0.04,
    (safeZoneW * 0.2) - (safeZoneW * 0.025),
    (safeZoneH * 0.853) - (safeZoneH * 0.08) - (safeZoneH * 0.2)
];
_radiosTable ctrlCommit 0;
uiNamespace setVariable ["f_test_tv", _radiosTable];


private _yourRadiosTable = _display ctrlCreate ["RscTreeSearch", _idc, _ctrlGroup]; _idc = _idc + 1;
_yourRadiosTable ctrlSetFont "EtelkaMonospacePro";
_yourRadiosTable ctrlSetFontHeight 0.03;
_yourRadiosTable ctrlSetBackgroundColor [0, 0, 0, 0.5];
_yourRadiosTable ctrlSetPosition 
[
    safeZoneW * 0.025,
    (safeZoneH * 0.853) - (safeZoneH * 0.2),
    (safeZoneW * 0.2) - (safeZoneW * 0.025),
    (safeZoneH * 0.2)
];
_yourRadiosTable ctrlCommit 0;
uiNamespace setVariable ["f_test_tv", _radiosTable];


private _titleBar = _display ctrlCreate ["CAFE_DefaultText", _idc, _ctrlGroup]; _idc = _idc + 1;
_titleBar ctrlSetPosition 
[
    safeZoneW * 0.025,
    0,
    (safeZoneW * 0.2) - (safeZoneW * 0.025),
    safeZoneH * 0.04
];
_titleBar ctrlSetBackgroundColor [0, 0, 0, 0.5];
_titleBar ctrlCommit 0;


private _sideBar = _display ctrlCreate ["CAFE_DefaultButton", _idc, _ctrlGroup]; _idc = _idc + 1;
_sideBar ctrlSetPosition 
[
    0,
    safeZoneH * 0.04,
    safeZoneW * 0.025,
    (safeZoneH * 0.853) - (safeZoneH * 0.04)
];
_sideBar ctrlSetBackgroundColor [0, 0, 0, 0.6];
_sideBar ctrlAddEventHandler ["ButtonClick", f_fnc_radioList_onSidebarClick];
_sideBar ctrlSetText ">>";
_sideBar ctrlCommit 0;


private _radioIcon = _display ctrlCreate ["RscPictureKeepAspect", _idc, _ctrlGroup]; _idc = _idc + 1;
_radioIcon ctrlSetPosition 
[
    0,
    0,
    safeZoneW * 0.025,
    safeZoneH * 0.04
];
_radioIcon ctrlSetBackgroundColor [0, 0, 0, 0.6];
_radioIcon ctrlSetText "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa";
_radioIcon ctrlCommit 0;


[_titleBar, _radiosTable, _yourRadiosTable] call f_fnc_refreshRadioList;

f_fnc_radioList_monitorForRefresh = 
{
    [
        {
            private _compare = [side group player, [side group player] call f_fnc_getRadioList, [player] call f_fnc_getRadioChannelsForUnit];

            if ((_this#0) isNotEqualTo _compare) then
            {
                ((_this#1) + _compare) call f_fnc_refreshRadioList;
            };

            [_compare, _this#1] call f_fnc_radioList_monitorForRefresh;
        },
        _this,
        10    
    ] call CBA_fnc_waitAndExecute;
};

private _groupSide = side group player;

[
    [_groupSide, [_groupSide] call f_fnc_getRadioList, [player] call f_fnc_getRadioChannelsForUnit],
    [_titleBar, _radiosTable, _yourRadiosTable]
] call f_fnc_radioList_monitorForRefresh;