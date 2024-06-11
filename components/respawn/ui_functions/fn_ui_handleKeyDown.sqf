params ["","_key","_shift","_ctrl","_alt"];


if (_key == 0x32) exitWith {
    [] call ace_spectator_fnc_ui_toggleMap;
    true
};


if (_key == 0x38) exitWith {
    [true] call ace_spectator_fnc_cam_toggleSlow;
    true
};


if (_key == 0x01) exitWith {
    if (ace_spectator_uiMapVisible) then {
        [] call ace_spectator_fnc_ui_toggleMap;
    } else {
        if (ace_spectator_uiForced) then {
            private _displayType = ["RscDisplayInterrupt","RscDisplayMPInterrupt"] select isMultiplayer;
            (findDisplay 60000) createDisplay _displayType;
        } else {
            [false] call ace_spectator_fnc_setSpectator;
        };
    };
    true
};


if (_key in [0x39, 0x9C]) exitWith {
    private _oldMode = ace_spectator_camMode;
    private _modes = ace_spectator_availableModes;

    
    private _iMode = (_modes find _oldMode) max 0;
    private _countModes = count _modes;

    if (_countModes != 0) then {
        _iMode = (_iMode + 1) % _countModes;
        if (_iMode < 0) then { _iMode = _countModes + _iMode; };
    };

    private _newMode = _modes select _iMode;

    [_newMode] call ace_spectator_fnc_cam_setCameraMode;

    true
};


if (_key == 0x31) exitWith {
    private _oldVision = ace_spectator_camVision;
    private _visions = ace_spectator_availableVisions;

    
    private _iVision = (_visions find _oldVision) max 0;
    private _countVisions = count _visions;

    if (_countVisions != 0) then {
        _iVision = (_iVision + 1) % _countVisions;
        if (_iVision < 0) then { _iVision = _countVisions + _iVision; };
    };

    private _newVision = _visions select _iVision;

    [_newVision] call ace_spectator_fnc_cam_setVisionMode;
    true
};


if (_key == 0xC9) exitWith {
    setViewDistance ((viewDistance + 250) min 2500);
    true
};


if (_key == 0xD1) exitWith {
    setViewDistance ((viewDistance - 250) max 500);
    true
};


if (_key == 0x26) exitWith {
    if (ace_spectator_camLight) then {
        { deleteVehicle _x; } forEach ace_spectator_camLights;
        ace_spectator_camLights = [];
    } else {
        private _cameraLight = "#lightpoint" createvehicleLocal getPosASL ace_spectator_camera;
        _cameraLight setLightBrightness 2;
        _cameraLight setLightAmbient [1,1,1];
        _cameraLight setLightColor [0,0,0];
        _cameraLight lightAttachObject [ace_spectator_camera, [0,0,0]];

        private _pointerLight = "#lightpoint" createvehicleLocal getPosASL ace_spectator_camera;
        _pointerLight setLightBrightness 1;
        _pointerLight setLightAmbient [1,1,1];
        _pointerLight setLightColor [0,0,0];

        ace_spectator_camLights = [_cameraLight, _pointerLight];
    };

    ace_spectator_camLight = !ace_spectator_camLight;

    true
};


if (_key == 0x0E) exitWith {
    [] call ace_spectator_fnc_ui_toggleUI;
    true
};


if (_key == 0x3B) exitWith {
    ace_spectator_uiHelpVisible = !ace_spectator_uiHelpVisible;

    [] call ace_spectator_fnc_ui_updateHelp;

    ((findDisplay 60000) displayCtrl 60021) ctrlShow ace_spectator_uiHelpVisible;
    ((findDisplay 60000) displayCtrl 60020) ctrlShow ace_spectator_uiHelpVisible;

    true
};


if (_key == 0x17) exitWith {
    ace_spectator_uiWidgetVisible = !ace_spectator_uiWidgetVisible;
    [] call ace_spectator_fnc_ui_updateWidget;
    true
};


if (_key == 0x19) exitWith {
    ace_spectator_drawProjectiles = !ace_spectator_drawProjectiles;
    true
};


if (_key == 0x18) exitWith {
    ace_spectator_drawUnits = !ace_spectator_drawUnits;
    true
};


if (_key == 0xCD) exitWith {
    [true] call ace_spectator_fnc_switchFocus;
    true
};


if (_key == 0xCB) exitWith {
    [false] call ace_spectator_fnc_switchFocus;
    true
};


if ((_key in (actionKeys "CuratorInterface")) && {!isNull (getAssignedCuratorLogic player)}) exitWith {
    
    [false] call ace_spectator_fnc_ui;
    ace_spectator_camera camCommand "manual off";

    
    openCuratorInterface;

    
    [{!isNull curatorCamera},{
        curatorCamera setPosASL (getPosASL ace_spectator_camera);
        curatorCamera setDir (getDirVisual ace_spectator_camera);

        
        [getAssignedCuratorLogic player, 0] call bis_fnc_toggleCuratorVisionMode;
    }] call CBA_fnc_waitUntilAndExecute;
    true
};


if ((_key == 0x1F) and {_ctrl isEqualTo true}) exitWith 
{
    if (!alive player) then
    {
        [] call f_fnc_tryShowSpawnpointDialog;
    };
    true
};

false 