// get all spawn positions available to the given target (OBJECT, GROUP, SIDE or NAMESPACE)
// gotchas: doesn't support "leading side" or respawnable vehicles

params ["_target"];

private _fnc_logicAvailableToTarget = 
{
	params ["_logic", "_target"];

	private _respawnLocations = (_logic getvariable "respawn");

	if (isNil "_respawnLocations") exitWith { false }; // Respawn point disabled.

	private _sideId = parseNumber (_logic getVariable ["side", "-1"]); // Id < 0 = "leading side".  We are interpreting as "any side" instead.
	private _typeId = parseNumber (_logic getVariable ["type", "-1"]);

	if (_typeId > 0) exitWith { false }; // Type is not "Infantry respawn".

	if (_target isKindOf "CAManBase") then
	{
		_target = group _target;
	};

	if (_target isEqualType grpNull) then
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

	if (_target isKindOf "CAManBase") then
	{
		_target = group _target;
	};

	if (_target isEqualType grpNull) then
	{
		_target = side _target;
	};

	if (_target isEqualType sideEmpty) exitWith
	{
		private _sideString = ["east", "west", "guer", "civ"] select (_target call bis_fnc_sideID);
		(_markerName find ("respawn_" + _sideString) >= 0)
	};
};

private _candidateMarkers = allMapMarkers; // Don't pre-filter, extra string searches for no reason.
private _availableMarkers = _candidateMarkers select {[_x, _target] call _fnc_markerAvailableToTarget};

private _candidateLogics = "ModuleRespawnPosition_F" allObjects 1; // BUB 2025-09-21 TODO :: cache this list with staleness timer
private _availableLogics = _candidateLogics select {[_x, _target] call _fnc_logicAvailableToTarget};

(_availableMarkers + _availableLogics)