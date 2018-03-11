
// Maintain 4 vehicles at all times.
[] spawn 
{
	// Give em a chance tho.
	sleep 120;
	
	_vehicleDefs = 
	[
		[["crew","crew","crew"],"taki_veh_1","feruz_area","LOP_IA_M1025_W_M2","ind_f",independent],
		[["crew","crew","crew"],"taki_veh_2","feruz_area","LOP_IA_BMP2","ind_f",independent],
		[["crew","crew","crew","crew"],"taki_veh_3","feruz_area","LOP_IA_M1A1_AIM_D","ind_f",independent],
		[["crew","crew","crew"],"taki_veh_1","feruz_area","LOP_IA_BTR80","ind_f",independent],
		[["crew","crew","crew"],"taki_veh_2","feruz_area","LOP_IA_M1025_W_M2","ind_f",independent]
	];
	
	_groupsActive = [];	
	
	while {true} do 
	{
		{
			_vehDef = _x;
			_group = _vehDef call ca_fnc_spawnvehicleattack;
			_groupsActive pushBack (_group select 0);

			waitUntil 
			{
				sleep 2;
			
				_newActive = [];
				
				{
					_curGroup = _x;
					if ({alive _x} count (units _curGroup) > 0) then
					{
						_newActive pushBack _x;
					}
					
				} forEach _groupsActive;
				
				_groupsActive = _newActive;
				
				count _groupsActive < 4
			};
			
		} forEach _vehicleDefs;
		
	}
	
};


// Maintain 6 normal squads at all times.
[] spawn 
{
	_vehicleDefs = 
	[
		[["sl","rif","medic","lmg","lat","gren"],"taki_squad_1","feruz_area","ind_f",independent],
		[["sl","rif","mat","rif","rif","lat"],"taki_squad_2","feruz_area","ind_f",independent],
		[["sl","rif","rif","lmg","lat","gren"],"taki_squad_3","feruz_area","ind_f",independent],
		[["sl","rif","rif","rif","lat","gren"],"taki_squad_4","feruz_area","ind_f",independent]
	];
	
	_groupsActive = [];	
	
	while {true} do 
	{
		{
			_vehDef = _x;
			_group = _vehDef call ca_fnc_spawnattack;
			_groupsActive pushBack _group;
			
			[_group] spawn ca_fnc_groupGuerrillaAI;

			waitUntil 
			{
				sleep 4;
			
				_newActive = [];
				
				{
					_curGroup = _x;
					if ({alive _x} count (units _curGroup) > 0) then
					{
						_newActive pushBack _x;
					}
					
				} forEach _groupsActive;
				
				_groupsActive = _newActive;
				
				count _groupsActive < 6
			};
			
		} forEach _vehicleDefs;
		
	}
	
};


// Maintain 2 helicopters at all times.
[] spawn 
{
	// Give em a chance tho.
	sleep 180;

	_vehicleDefs = 
	[
		[["pilot","pilot"],"taki_heli_1","feruz_area","LOP_IA_Mi24V_AT","ind_f",independent],
		[["pilot","pilot","crew","crew","crew","crew"],"taki_heli_2","feruz_area","RHS_UH1Y_d","ind_f",independent],
		[["pilot","pilot","crew","crew","crew","crew"],"taki_heli_1","feruz_area","RHS_Mi8mt_vdv","ind_f",independent],
		[["pilot","pilot","crew","crew","crew","crew"],"taki_heli_2","feruz_area","RHS_Mi8mt_vdv","ind_f",independent]
	];
	
	_groupsActive = [];	
	
	while {true} do 
	{
		{
			_vehDef = _x;
			_group = _vehDef call ca_fnc_spawnvehicleattack;
			_groupsActive pushBack (_group select 0);

			waitUntil 
			{
				sleep 6;
			
				_newActive = [];
				
				{
					_curGroup = _x;
					if ({alive _x} count (units _curGroup) > 0) then
					{
						_newActive pushBack _x;
					}
					
				} forEach _groupsActive;
				
				_groupsActive = _newActive;
				
				count _groupsActive < 2
			};
			
		} forEach _vehicleDefs;
		
	}
	
};


// Keep vehicles moving into Feruz
[] spawn
{
	while {true} do
	{
	
		_list = (position taki_veh_area) nearEntities [["Man", "Car", "Tank"], 200];
		
		{ _x doMove (getPos feruz_finaltrigger); } forEach _list;
		
		sleep 15;
	
	}
	
}
