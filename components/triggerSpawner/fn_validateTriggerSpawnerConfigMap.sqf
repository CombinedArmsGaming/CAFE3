params ["_logic", "_configMap"];

private _requiredKeys = ["type", "category", "unit"];

{
	if (isNil {_configMap get _x}) then
	{
		throw format ["[Trigger Spawner] Need a '%1' config for logic entity '%2'.", _x, _logic];
	};

} forEach _requiredKeys;

private _typesWhichNeedRadius = ["Patrol Area", "Garrison Area"];
private _currentType = _configMap getOrDefault ["type", ""];

if (_currentType in _typesWhichNeedRadius) then
{
	if (isNil {_configMap get "radius"}) then
	{
		throw format ["[Trigger Spawner] Need a 'radius' config for logic entity '%1' because 'type' is '%2'.", _logic, _currentType];
	};
};