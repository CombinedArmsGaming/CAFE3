// get all spawn positions available to the given target (OBJECT, GROUP, SIDE or NAMESPACE)
// gotchas: doesn't support "leading side" or vehicles

params ["_target"];

private _fnc_logicAvailableToTarget = 
{
	params ["_logic", "_target"];

	private _sideId = _logic getVariable ["side", -1];
	private _typeId = _logic getVariable ["type", -1];

	if (_typeId > 0) exitWith { false };

	if (_target isEqualTypeAny [objNull, grpNull]) then
	{
		_target = side _target;
	};

	if (_target isEqualType sideEmpty) exitWith
	{
		(_sideId < 0) or {_sideId isEqualTo (_target call bis_fnc_sideID)}
	};
	
	(_sideId < 0)
};

private _fnc_markerAvailableToTarget = 
{
	params ["_markerName", "_target"];

	if (_target isEqualTypeAny [objNull, grpNull]) then
	{
		_target = side _target;
	};

	if (_target isEqualType sideEmpty) exitWith
	{
		private _sideString = ["east", "west", "guer", "civ"] select (_target call bis_fnc_sideID)
		(_markerName find ("respawn_" + sideString) >= 0)
	};
};

private _candidateMarkers = allMapMarkers; // Don't pre-filter, extra string searches for no reason.

private _availableMarkers = _candidateMarkers select {[_x, _target] call _fnc_markerAvailableToTarget};

switch (typename _target) do {
	case (typename objnull): {
		_objectPositions = if (isnull _target) then {_default} else {_target getvariable [_varName,_default]};
		_groupPositions = if (isnull group _target) then {_default} else {(group _target) getvariable [_varName,_default]};
		_sidePositions = missionnamespace getvariable [_varName + str (_target call bis_fnc_objectSide),_default];
	};
	case (typename grpnull): {
		_groupPositions = if (isnull _target) then {_default} else {(_target) getvariable [_varName,_default]};
		_sidePositions = missionnamespace getvariable [_varName + str (_target call bis_fnc_objectSide),_default];
	};
	case (typename sideunknown): {
		_sidePositions = missionnamespace getvariable [_varName + str (_target),_default];
	};
	case (typename missionnamespace): {
	};
};