params ["_jumper", "_groupName"];

_doVehicleJump = 
	'params ["_target", "_caller"];

	[[_caller, "%1"], "bub\bub_vm_cl_tryJumpIntoGroupVehicle.sqf"] remoteExec ["execVM", _caller]';



if (isServer) then
{
	[
		_jumper, 
		
		[
			format ["Jump into %1's vehicle", _groupName],
			format [_doVehicleJump, _groupName],
			nil, 
			6, 
			true, 
			true, 
			"", 
			"true", 
			2
		]
		
	] remoteExec ["addAction", 0];
	
};