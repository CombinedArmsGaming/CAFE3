params ["_logic", "_configMap"];

if (vehicleVarName _logic isEqualTo "") then
{
	throw format ["[Trigger Spawner] All logic nodes require a 'Variable Name' in the editor.  Ignoring node at coordinates %1.", getPos _logic];
};

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

private _categoryName = _configMap get "category";
private _category = missionConfigFile >> "CA_ZeusUI_Units" >> _categoryName;

if !(isClass _category) then
{
	throw format ["[Trigger Spawner] Invalid Zeus Spawner category '%1' for logic entity '%2'.", _categoryName, _logic];
};

private _unitName = _configMap get "unit";
private _unit = _category >> _unitName;

if !(isClass _unit) then
{
	throw format ["[Trigger Spawner] Couldn't find Zeus Spawner unit '%1' in category '%2' for logic entity '%3'.", _unitName, _categoryName, _logic];
};