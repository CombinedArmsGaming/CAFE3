_logic = _this param [0,objnull,[objnull]];
_activated = _this param [2,true,[true]];

systemChat "beep";

if (_activated) then {

	//--- Draw respan positions for players
	true call bis_fnc_drawRespawnPositions;
	if !(isserver) exitwith {};

	//--- Server init
	_typeID = 0;
	_sideID = 0;

	_name = _logic getvariable ["Name",""];
	if (isnumber (configfile >> "cfgvehicles" >> typeof _logic >> "respawnSide")) then {
		//--- Module with pre-define params
		_sideID = getnumber (configfile >> "cfgvehicles" >> typeof _logic >> "respawnSide");
		_typeID = getnumber (configfile >> "cfgvehicles" >> typeof _logic >> "respawnType");
	} else {
		//--- Module with adjustable params
		_typeID = (_logic getvariable ["Type","0"]) call BIS_fnc_parseNumberSafe;
		_sideID = (_logic getvariable ["Side","-1"]) call BIS_fnc_parseNumberSafe;
	};
	_showNotification = (_logic getvariable ["ShowNotification","1"]) call BIS_fnc_parseNumberSafe;

	//--- Detect the leading side
	if (_sideID < 0) then {
		if (ismultiplayer) then {
			_maxScore = -1;
			{
				_score = scoreside _x;
				if (_score > _maxScore) then {
					_maxScore = _score;
					_sideID = _x call bis_fnc_sideID;
				} else {
					if (_score == _maxScore) then {
						_sideID = -1;
					};
				};
			} foreach [opfor,blufor,independent,civilian];
		} else {
			_sideID = (player call bis_fnc_objectSide) call bis_fnc_sideID;
		};
	};

	if (_sideID in [0,1,2,3]) then {
		private ["_side","_pos","_markerPrefix","_markerType","_respawnPositions","_respawnObjects","_type","_respawn"];
		_side = _sideID call bis_fnc_sideType;
		_pos = position _logic;
		_markerType = ["respawn_inf","respawn_unknown","respawn_motor","respawn_armor","respawn_air","respawn_plane","respawn_naval"] select _typeID;
		_respawnPositions = [];
		_respawnObjects = [];

		if (_typeID > 0) then {
			private ["_markerSide"];
			_markerSide = ["east","west","guerrila","civilian"] select _sideID;
			_respawn = "respawn_vehicle_" + _markerSide + str _pos;
			createmarker [_respawn,_pos];
			_respawn setmarkerdir ((round direction _logic) * 360);
			_respawn setmarkersize [1,1];
			_respawn setmarkercolor ([_side,true] call bis_fnc_sidecolor);
			_respawn setmarkertype _markerType;
			_logic setvariable ["marker",_respawn];
			//_respawn setmarkertext (_name call bis_fnc_localize);
			_respawnPositions pushback _respawn;
			_respawnObjects pushback objnull;
		} else {
			//--- Respawn in vehicle
			{
				if (typeName _x isEqualTo "OBJECT") then {
					_respawn = [_side,_x,_name] call bis_fnc_addRespawnPosition;
					_respawnPositions pushback _respawn;
					_respawnObjects pushback _x;
				};
			} foreach (synchronizedobjects _logic);

            private _markerName = _logic getVariable ["markerName", ""];
            if (_markerName isNotEqualTo "") then
            {
                systemChat "adding marker";
				_respawn = [_side,_markerName,_name] call bis_fnc_addRespawnPosition;
				_respawnPositions pushback _respawn;
				_respawnObjects pushback objnull;
            };

			//--- Respawn on position (when no vehicles are synced)
			if (count _respawnPositions == 0) then {
				_respawn = [_side,_logic,_name] call bis_fnc_addRespawnPosition;
				_respawnPositions pushback _respawn;
				_respawnObjects pushback objnull;
			};
		};
		_logic setvariable ["respawn",_respawnPositions];

		//--- Show notifications
		_type = gettext (configfile >> "cfgmarkers" >> _markerType >> "name");
		{
			if (_name == "") then {
				private ["_namePos"];
				_name = "";
				_namePos = [0,0,0];
				_veh = _respawnObjects select _foreachindex;
				if (!isnull _veh) then {
					_name = gettext (configfile >> "cfgvehicles" >> (typeof _veh) >> "displayname");
					_namePos = position _veh;
				} else {
					_name = format [localize "str_a3_bis_fnc_respawnmenuposition_grid",mapgridposition _pos];
					_namePos = _pos;
				};
				_name = _name + " - " + (_namePos call bis_fnc_locationdescription);
			} else {
				_name = _name call bis_fnc_localize;
			};

			if (_showNotification > 0) then
			{
				[["RespawnAdded",[_type,_name,_markerType call bis_fnc_textureMarker]],"BIS_fnc_showNotification",_side] call bis_fnc_mp;
			};
		} foreach _respawnPositions;

		//--- Update markers and actual module positions
		_list = missionnamespace getvariable ["BIS_fnc_moduleRespawnPosition_list",[]];
		_list pushback _logic;
		missionnamespace setvariable ["BIS_fnc_moduleRespawnPosition_list",_list];
		if (isnil "BIS_fnc_moduleRespawnPosition_loop") then {
			BIS_fnc_moduleRespawnPosition_loop = [] spawn {
				scriptname "bis_fnc_moduleRespawnPosition: Loop";
				_listMarkers = [];
				waituntil {
					_list = missionnamespace getvariable ["BIS_fnc_moduleRespawnPosition_list",[]];
					_refresh = false;
					{
						if !(isnull _x) then {
							//--- Update position
							_pos = _x getvariable ["BIS_fnc_position_forced",[0,0,0]];
							if (position _x distance _pos > 0) then {
								_pos = position _x;
								_x setvariable ["BIS_fnc_position_forced",_pos,true]; //--- Force rewire for BIS_fnc_position

								_marker = _x getvariable ["marker",""];
								if (_marker != "") then {
									_marker setmarkerpos _pos;
									if !(_marker in _listMarkers) then {_listMarkers pushback _marker;};
								};
							};
						} else {
							_refresh = true;
						};
						sleep 0.1;
					} foreach _list;
					if (_refresh) then {
						//--- Remove deleted modules from the list
						_list = _list - [objnull];
						missionnamespace setvariable ["BIS_fnc_moduleRespawnPosition_list",_list];

						//--- Remove markers of deleted modules
						_listMarkersDelete = +_listMarkers;
						{
							_listMarkersDelete = _listMarkersDelete - [_x getvariable ["marker",""]];
						} foreach _list;
						{deletemarker _x;} foreach _listMarkersDelete;
					};
					count _list == 0
				};
				BIS_fnc_moduleRespawnPosition_loop = nil;
			};
		};
	} else {
		["Respawn %1 not added, all sides have the same score.",_logic] call bis_fnc_logFormat;
	};
} else {

	//--- Remove
	_respawnPositions = _logic getvariable ["respawn",[]];
	{
		if (typename _x == typename []) then {
			_x call bis_fnc_removeRespawnPosition;
		} else {
			deletemarker _x;
		};
	} foreach _respawnPositions;
	_logic setvariable ["respawn",nil];
};