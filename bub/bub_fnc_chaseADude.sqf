params ["_chaser", "_searchCenter"];

_list = _searchCenter nearEntities [["Man", "Car"], 255];
_goTo = nullObj;

{
	if (side _x == west) then 
	{
		_goTo = _x;
	}; 
	
} forEach _list;


[_goTo, _chaser] spawn 
{ 
	params ["_goTo2", "_chaser2"]; 
	_move = 1; 
	
	while {alive _chaser2} do 
	{ 
		(driver _chaser2) doMove (getPos _goTo2); 
		if ((position _goTo2) distance (position _chaser2) < 40) then 
		{
			_chaser2 setDamage 1;
		}; 
		
		sleep 1; 
	}; 
};