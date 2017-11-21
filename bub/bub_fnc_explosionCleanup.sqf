params ["_bomb"];

[_bomb] spawn 
{
	params ["_bomb"];

	_triggers = (getPos _bomb) nearObjects ["EmptyDetector", 500];
	{deleteVehicle _x;} forEach _triggers;
	
	sleep 1;
	
	{
		_group = _x;
		
		{
			_unit = _x;
			
			if ((_unit distance _bomb) < 500) then 
			{ 
				deleteVehicle _unit; 
			};
			
			sleep 0.1;
			
		} forEach (units _group);
		
	} forEach allGroups;
	
};

