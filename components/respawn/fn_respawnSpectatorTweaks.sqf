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


// Reposition the camera buttons to center them within the new background.
{
    private _curPos = (ctrlPosition _x) # 0;
    _x ctrlSetPositionX (_curPos - (0.3 * (((safezoneW / safezoneH) min 1.2) / 40)));
    _x ctrlCommit 0;

} forEach
[
    _display displayCtrl 52810,
    _display displayCtrl 52811,
    _display displayCtrl 52809
]