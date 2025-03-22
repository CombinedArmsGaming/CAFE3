/*
	Created By: JC + minor edit by Bubbus
*/

params ["_object", "_isLarge", "_proxySide", "_proxyRange"];

private _proxy = createTrigger ["EmptyDetector", getPos _object];
_proxy setVariable ["iedObj", _object];
_object setVariable ["iedProxyTrigger", _proxy];

_proxy setTriggerActivation [str _proxySide, "PRESENT", false];
_proxy setTriggerArea [_proxyRange, _proxyRange, 0, false, _proxyRange * 2];	// *2 because the z axis goes above and below the ground
_proxy attachTo [_object];

private _onAct = "thisTrigger getVariable ""iedObj"" setDamage 1;";
private _condition = "thisList findIf {_x != thisTrigger getVariable ""iedObj""} > -1";

_proxy setTriggerStatements [_condition, _onAct, ""];

// Ensure we're not leaving triggers behind.
_object addEventHandler ["Killed", 
{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	private _proxyTrigger = _unit getVariable ["iedProxyTrigger", objNull];
	deleteVehicle _proxyTrigger;
}];