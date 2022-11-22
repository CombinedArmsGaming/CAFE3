// Move camera controls to the top of the screen to avoid cursor blockage by respawn UI elements.

params ["_display"];

uiNamespace setVariable ["f_display_egRespawn", _display];

// Get overall cam controls group, position just below the game time indicator.
private _cameraModesGroup = _display displayCtrl 52909;


// Movements are according to measurement formulae from the RscDisplayEGSpectator config.
private _backgroundX = 16 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2);
_backgroundX = _backgroundX - (0 * (((safezoneW / safezoneH) min 1.2) / 40));

private _backgroundY = safezoneY - (0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
_backgroundY = _backgroundY + (1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));

private _curPosition = ctrlPosition _cameraModesGroup;

_cameraModesGroup ctrlSetPosition [_backgroundX, _backgroundY];
_cameraModesGroup ctrlCommit 0;


// Resize the element background to line up with the game time indicator.
private _cameraModesBackground = _display displayCtrl 52610;
_cameraModesBackground ctrlSetPositionX 0;
_cameraModesBackground ctrlSetPositionW (8 * (((safezoneW / safezoneH) min 1.2) / 40));
_cameraModesBackground ctrlCommit 0;


// Find which spectate modes are forbidden by ACE config.  Apply this config to the default spectator also.
// The array below has been modified from the ACE settings as BIS spectate does not support disabling 1PP (#1) view.
private _aceOriginalModes = [[0,1,2], [1,2], [0,1], [1], [1,2]] select ace_spectator_restrictModes;
private _removeModes = [0,1,2] - _aceOriginalModes;


// Reposition the camera buttons to center them within the new background.
{
    private _curPos = (ctrlPosition _x) # 0;
    _x ctrlSetPositionX (_curPos - (0.3 * (((safezoneW / safezoneH) min 1.2) / 40)));

    if (_forEachIndex in _removeModes) then
    {
        _x ctrlSetTextColor [1,1,1,0.2];
    };

    _x ctrlCommit 0;

} forEach
[
    _display displayCtrl 52809,
    _display displayCtrl 52811,
    _display displayCtrl 52810
];


// Enforce spectate modes and set to 1PP mode if either of the others are disabled.
[
    {
        private _allow3PPCam = !(2 in _this);
        private _allowFreeCam = !(0 in _this);

        missionNamespace setVariable ["BIS_EGSpectator_allowFreeCamera", _allowFreeCam];
        missionNamespace setVariable ["BIS_EGSpectator_allow3PPCamera", _allow3PPCam];
        missionNamespace setVariable ["BIS_EGSpectator_showFocusInfo", false];

        if !(_allow3PPCam and _allowFreeCam) then
        {	
            ["SetFocus", [player]] call (uiNamespace getVariable ["RscDisplayEGSpectator_script", {}]);
            ["SetCameraMode", ["fps"]] call BIS_fnc_EGSpectatorCamera;
        };
    }, 
    _removeModes
] call CBA_fnc_execNextFrame;