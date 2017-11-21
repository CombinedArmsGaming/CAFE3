params ["_posObj", "_vol", "_dist"];

if (!isServer) exitWith {};

private ["_handle"];

_handle = [_posObj, _vol, _dist] spawn 
{
	params ["_posObj2", "_vol2", "_dist2"];
	
	private ["_allsounds","_source"];
	
	_allsounds = [];
	_source = _posObj2;

	while {true} do	
	{
		private ["_sound","_sound1","_sound2","_maxtype"];
		
		_allsounds = _allsounds - _allsounds;
		_sound1 = format ["A3\Sounds_F\ambient\battlefield\battlefield_explosions%1.wss",ceil (random 5)];
		_sound2 = format ["A3\Sounds_F\ambient\battlefield\battlefield_firefight%1.wss",ceil (random 4)];
		
		_allsounds pushBack _sound1;
		_allsounds pushBack _sound2;
		
		_maxtype = (count _allsounds);
		_sound = _allsounds select (floor random _maxtype);
		
		playsound3d [_sound,_source,false,getPosasl _source,_vol2,1,_dist2];			
		sleep (5 + random 10);
		
	};
	
};

_handle