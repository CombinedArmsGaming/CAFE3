params ["_floater", "_caller", "_actionId"];


_alreadyReleased = _floater getVariable ["alreadyReleased", false];

if !(_alreadyReleased) then 
{
	_floater setVariable ["alreadyReleased", true];

	[_floater, _actionId] remoteExec ["removeAction", 0];

	
	_clampedFront = _floater getVariable ["clamped_front", objNull];
	_clampedRear = _floater getVariable ["clamped_rear", objNull];

	detach _clampedFront;
	detach _clampedRear;
	
};

