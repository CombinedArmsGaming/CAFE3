params [["_vehicle", objNull, [objNull]]];




_vehicle setVariable ["Is SVBIED?", 1];




bub_fnc_addSvbiedDriverHook = 
{
	params ["_unit"];
	
	private _handlerIdx = _unit getVariable "SVBIED Handler Index";
	
	if !(typename _handlerIdx == "SCALAR") then
	{
		_handlerIdx = _unit addEventHandler 
		[
			"Killed",
			{
				params ["_unit2"];
				
				private _drivingVeh = _unit2 getVariable "Driving SVBIED";
				
				if !(isNull _drivingVeh) then
				{
					private _vehIsSvbied = _drivingVeh getVariable "Is SVBIED?";
					if (_vehIsSvbied == 1) then
					{
						_drivingVeh setDamage 1;
					};
					
					_unit2 setVariable ["Driving SVBIED", null];
					
				};
				
				private _handlerIdx2 = _unit2 getVariable "SVBIED Handler Index";
				//diag_log format ["In adddriverhook, idx #[%1] for %2", _handlerIdx2, _unit2];
				
				if (typename _handlerIdx2 == "SCALAR") then
				{
					_unit2 removeEventHandler ["Killed", _handlerIdx2];
				};
				
			}
			
		];
		
		_unit setVariable ["SVBIED Handler Index", _handlerIdx];
		//diag_log format ["Added handler idx #[%1]", _handlerIdx];
		
	};
	
};




private _vehKillIdx = _vehicle addEventHandler 
[ 
	"Killed", 
	{ 
		params ["_veh"];
		
		private _pos = (getPos _veh) vectorAdd [3,3,20];
		[_pos] call bub_fnc_makeExplosion;
		_pos = (getPos _veh) vectorAdd [-3,-3,20];
		[_pos] call bub_fnc_makeExplosion;
			
		//_veh setVariable ["SVBIED Exploded?", 1];
		
		private _handlerIdx = _veh getVariable "SVBIED Killed Index";
		//diag_log format ["In vehkilled, idx #[%1] for %2", _handlerIdx, _veh];
		
		if (typename _handlerIdx == "SCALAR") then
		{
			_veh removeEventHandler ["Killed", _handlerIdx];
		};
		
		_veh setVariable ["SVBIED Killed Index", null];
		
	} 
	
];

_vehicle setVariable ["SVBIED Killed Index", _vehKillIdx];




_vehicle addEventHandler 
[ 
	"GetOut", 
	{ 
		params ["_veh", "_pos", "_unit"];
	
		_veh setDamage 1;
		
		private _handlerIdx = _unit getVariable "SVBIED Handler Index";
		//diag_log format ["In getout, idx #[%1] for %2", _handlerIdx, _unit];
		
		if (typename _handlerIdx == "SCALAR") then
		{
			_unit removeEventHandler ["Killed", _handlerIdx];
		};
		
		_unit setVariable ["SVBIED Handler Index", null];
		_unit2 setVariable ["Driving SVBIED", null];
	} 
	
];




_vehicle addEventHandler 
[ 
	"Explosion", 
	{ 
		private _unit = (_this select 0); 
		_unit setDamage 1;
	} 
	
];




_vehicle addEventHandler 
[ 
	"GetIn", 
	{ 
		params ["_veh", "_pos", "_unit"];
		
		_unit setVariable ["Driving SVBIED", _veh];
		
		[_unit] call bub_fnc_addSvbiedDriverHook;
		
		_unit setVariable ["SVBIED Handler Index", _handlerIdx];
		
	} 
	
];




private _driver = driver _vehicle;

if !(isNull _driver) then
{
	[_driver] call bub_fnc_addSvbiedDriverHook;
};