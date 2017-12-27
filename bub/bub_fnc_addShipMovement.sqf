params ["_ship"];

[_ship] spawn
{
	params ["_ship"];

	waitUntil
	{
		sleep 1;
		
		_hasTravelled = missionNamespace getVariable ["bub_timeTravelled", 0];
		
		(_hasTravelled == 1)
		
	};
	
	
	for [{_t = 0;}, {_t < 300}, {_t = _t+1}] do
	{
		_dir = [0.25, 0.75, 0];
		
		_ship setPos ((getPos _ship) vectorAdd _dir);
		
		sleep 0.25;
	};
	
};

