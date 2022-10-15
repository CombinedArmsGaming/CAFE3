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