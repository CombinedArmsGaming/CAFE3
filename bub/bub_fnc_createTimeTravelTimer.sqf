if (!isServer) exitWith {};

[] spawn
{
	setTimeMultiplier 1;

	waitUntil 
	{
		sleep 1; 
		
		_curTime = daytime;
		
		(_curTime >= (21 + 21/60))
		
	};

	[] call bub_fnc_doTimeTravel;
	
};