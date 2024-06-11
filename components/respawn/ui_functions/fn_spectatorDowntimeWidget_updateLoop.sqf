#include "macros.hpp"

disableSerialization;

// Check if widget is gone or hidden using down indicator as a sample.
private _downIndicator = uiNamespace getVariable "f_downtimeWidget_downIndicator";
if ((isNil "_downIndicator") or {isNull _downIndicator}) exitWith 
{
    uiNamespace setVariable ["f_downtimeWidget_state", nil];
};


private _state = uiNamespace getVariable ["f_downtimeWidget_state", ["DEAD"]];
_state params ["_prevDownState"];

private _isDown = IS_UNCONSCIOUS(player);
private _isDead = PLAYER_IS_DEAD;

private _downState = switch (str _isDown + "::" + str _isDead) do 
{
    case "true::true": 
    {
        "DEAD"
    };
    case "false::true": 
    {
        "DEAD"
    };
    case "true::false": 
    {
        "DOWN"
    };
    case "false::false": 
    {
        "ALIVE"
    };
    default 
    {
        // wtf
        "CURSED"
    };
};


uiNamespace setVariable ["f_downtimeWidget_state", [_downState]];


if (_downState isNotEqualTo _prevDownState) then
{
    private _chooseSpawnButton = uiNamespace getVariable "f_downtimeWidget_chooseSpawnButton";
    private _chooseSpawnText = uiNamespace getVariable "f_downtimeWidget_chooseSpawnButtonText";
    private _ctrlGroup = uiNamespace getVariable "f_downtimeWidget_ctrlGroup";

    _downIndicator ctrlSetText _downState;
    _downIndicator ctrlSetTextColor (switch (_downState) do {case "DEAD": {[1, 0.7, 0.7, 1]}; case "DOWN": {[0.7, 0.7, 1, 1]}; case "ALIVE": {[0.7, 1, 0.7, 1]}; default {[1,1,1,1]}; });
    _downIndicator ctrlCommit 0;

    _chooseSpawnButton ctrlShow (_downState isEqualTo "DEAD");
    _chooseSpawnButton ctrlCommit 0;

    _chooseSpawnText ctrlShow (_downState isEqualTo "DEAD");
    _chooseSpawnText ctrlCommit 0;

    _ctrlGroup ctrlSetPosition (if (_downState isEqualTo "DEAD") then
    {
        [
            (safeZoneW + safeZoneX) - (safeZoneW * 0.25),
            safeZoneY + (safeZoneH * 0.00),
            safeZoneW * 0.25,
            safeZoneH * 0.07
        ];
    }
    else
    {
        [
            (safeZoneW + safeZoneX) - (safeZoneW * 0.1),
            safeZoneY + (safeZoneH * 0.00),
            safeZoneW * 0.25,
            safeZoneH * 0.07
        ];
    });
    _ctrlGroup ctrlCommit 0.5;
    
};


// Loop it.
[
    f_fnc_spectatorDowntimeWidget_updateLoop,
    [],
    0.5
] call CBA_fnc_waitAndExecute;