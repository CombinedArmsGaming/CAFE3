params ["_unit"];

_unit setVariable ["ace_w_allow_dam",false,true];
_unit allowDamage false;

zeus_deployment = false;
_unit addAction ["Toggle Zeus Deployment mode", 
{
	zeus_deployment = !zeus_deployment;
	_onOff = "OFF";
	if (zeus_deployment) then {_onOff = "ON";};
	hint format ["Zeus deployment is %1.", _onOff];
}];

_unit addAction ["Add unit-spawner to Zeus mode", {execVM "bub\zeus_ui\bub_fnc_zeusSpawnButtons.sqf";}];

[_unit] spawn 
{
	params ["_unit"];
	
	zeus_camPosLast = getPos _unit;
	
	while {true} do 
	{
		_camPos = getPos curatorCamera;
		if (_camPos isEqualTo [0,0,0]) then 
		{
			if (zeus_deployment) then
			{
				zeus_camPosLast set [2, 0];
				[_unit, true] remoteExec ["bub_fnc_activateZeusPlayer", 2];
			}
			else
			{
				zeus_camPosLast = [0,0,0];
			};
			
			_unit setVehiclePosition [zeus_camPosLast, [], 1, "NONE"];
			
		};
		
		waitUntil 
		{
			!(getPos curatorCamera isEqualTo [0,0,0])
		};
		
		[_unit, false] remoteExec ["bub_fnc_activateZeusPlayer", 2];
		
		while {!(getPos curatorCamera isEqualTo [0,0,0])} do 
		{
			_camPos = getPos curatorCamera;
			_unit setPos _camPos;
			zeus_camPosLast = _camPos;
			
			sleep 0.5;
		}
	};
};