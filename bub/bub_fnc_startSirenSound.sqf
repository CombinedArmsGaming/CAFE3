params ["_posObj", "_vol", "_dist"];

if (!isServer) exitWith {};

_handle = [_posObj, _vol, _dist] spawn 
{
	params ["_posObj", "_vol", "_dist"];
	
	_source = _posObj;

	while {true} do	
	{
		_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		_sound = _soundPath + "sounds\blowout_siren.ogg";
		
		// playsound3d [_sound, _source, false, (getPosASL _source), _vol, 1, _dist];			
		_posObj say3D ["blowout_siren", 5000, 1];
		sleep 53;
		
	};
	
};

_handle