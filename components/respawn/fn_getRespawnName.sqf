// Get an appropriate name for the given spawn location.  Try to choose a decent fallback name if this isn't possible.

params ["_spawn"];

if (_spawn isEqualType objNull) exitWith
{
	private _name = "";

	if (typeOf _spawn isEqualTo "ModuleRespawnPosition_F") then
	{
		_name = _spawn getvariable["Name", ""];
	};

	if (_spawn isKindOf "CAManBase" and (alive _spawn)) then
	{
		_name = name _spawn;
	};

	if (_spawn isKindOf "AllVehicles" and (alive _spawn)) then
	{
		_name = (getText (configFile >> "CfgVehicles" >> (typeOf _spawn) >> "displayName"));
	};
	
	if (_name isEqualTo "") then
	{
		_name = ("Grid coordinates: " + mapGridPosition _spawn);
	};

	_name
};

if (_spawn isEqualType "") exitWith
{
	private _markerPos = getMarkerPos _spawn;

	if (_markerPos isNotEqualTo [0,0,0]) exitWith
	{
		("Grid coordinates: " + mapGridPosition _markerPos)
	};

	_spawn
};

str _spawn
