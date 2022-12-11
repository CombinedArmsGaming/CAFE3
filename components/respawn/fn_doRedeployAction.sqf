["open"] call BIS_fnc_showRespawnMenu;

private _ctrlHeaderButton = uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlHeaderRespawnButton";
_ctrlHeaderButton ctrlSetText "Redeploy to location";
_ctrlHeaderButton ctrlCommit 0;

_ctrlHeaderButton ctrlAddEventHandler ["ButtonClick", 
	{
		params ["_button"];

		private _respawnSelector = uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlLocList";
		private _selectedRespawnIdx = lbCurSel _respawnSelector;

		private _posMetadata = ["get", _selectedRespawnIdx] call BIS_fnc_showRespawnMenuPositionMetadata;
		_identity = (_posMetadata select 0) select 0;

		if !(isNil "_identity") then {[player,_identity] call BIS_fnc_moveToRespawnPosition};
		["close"] call BIS_fnc_showRespawnMenu;
	}
];

private _display = uiNamespace getVariable "bis_rscrespawncontrolsmap_display";
private _respawnHeader = uiNamespace getVariable "bis_rscrespawncontrolsmap_ctrlheaderbackground";
private _closeButton = uiNamespace getVariable ["f_redeployMenu_closeButton", controlNull];

if (isNull _closeButton) then
{
    private _group = ctrlParentControlsGroup _respawnHeader;
    _closeButton = _display ctrlCreate ["RscButton", 97531, _group];
    
    _closeButton ctrlAddEventHandler 
    [
        "ButtonClick", 
        {
            ["close"] call BIS_fnc_showRespawnMenu;
        }
    ];

    private _headerPos = ctrlPosition _respawnHeader;

    private _posX = (_headerPos#0);
    private _posY = (_headerPos#1) - 0.053;
    private _sizeX = 0.15;
    private _sizeY = 0.05;

    _closeButton ctrlSetPosition [_posX, _posY, _sizeX, _sizeY];
    _closeButton ctrlSetFont "PuristaLight";
    _closeButton ctrlSetText "EXIT";
    _closeButton ctrlSetShadow 0;
    _closeButton ctrlSetBackgroundColor [0.5, 0, 0, 1];
    _closeButton ctrlSetActiveColor [0.9, 0.9, 0.9, 1];

    _closeButton ctrlCommit 0;

    uiNamespace setVariable ["f_redeployMenu_closeButton", _closeButton];
};