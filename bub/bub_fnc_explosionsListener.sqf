"exfil_babushka" setMarkerAlpha 0;


waitUntil 
{
	sleep 1; 
	
	_bombsExploded = missionNamespace getVariable "bombsExploded";
	
	(!isNil "_bombsExploded")
	
};


"exfil_babushka" setMarkerAlpha 1;


[] spawn 
{
	_bgRadiationPerBomb = 2;
	_curRads = 0;
	_keepLooping = true;
	
	while { _keepLooping } do
	{

		_bombsExploded = missionNamespace getVariable "bombsExploded";
		
		_maxRadiation = (sqrt _bombsExploded) * 4 + 2.2;
		_radIncrement = _maxRadiation / 360;
		_curRads = missionNamespace getVariable "Cre8ive_BR_Strength";
		
		missionNamespace setVariable ["Cre8ive_BR_Strength", _curRads + _radIncrement];
		
		if (_curRads + _radIncrement > _maxRadiation) then
		{
			_keepLooping = false;
		};
		
		sleep 1;

	}
	
};


[] spawn
{
	sleep 60;
	
	60 setRain 1;
	
	sleep 60;
	
	60 setRain 1;
	60 setLightnings 1;
	
	forceWeatherChange;
};