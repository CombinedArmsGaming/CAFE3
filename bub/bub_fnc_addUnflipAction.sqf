params ["_vehicle"];

_onUnflip = 
{
	params ["_target", "_caller"];

	[[_target], "bub\bub_vm_cl_unflipVehicle.sqf"] remoteExec ["execVM", _target];
	
};



if (isServer) then
{
	[
		_vehicle, 
		
		[
			"<t color='#FF8844'>Unflip Vehicle</t>
	<br/>
	<t color='#AAAAAA'>Use with caution.</t>",

			_onUnflip,
			nil, 
			0, 
			true, 
			true, 
			"", 
			"(count crew _target) == 0", 
			5
		]
		
	] remoteExec ["addAction", 0];
};