params ["_target"];

private _timestamps = [];

switch (toLower typeName _target) do 
{
	case "object":
	{
		private _playerTimestamp = _target getVariable ["f_var_respawnTimestamp", 0];
		_timestamps pushBack _playerTimestamp;

		private _groupTimestamp = (group _target) getVariable ["f_var_respawnTimestamp", 0];
		_timestamps pushBack _groupTimestamp;

		private _side = _target getVariable ["f_var_playerSide", side _target];
		private _sideStr = [_side] call f_fnc_sideToString;
		private _sideTimestamp = missionNamespace getVariable ["f_var_respawnTimestamp_" + _sideStr, 0];
		_timestamps pushBack _sideTimestamp;
	};
	case "group": 
	{
		private _groupTimestamp = _target getVariable ["f_var_respawnTimestamp", 0];
		_timestamps pushBack _groupTimestamp;

		private _sideStr = [side _target] call f_fnc_sideToString;
		private _sideTimestamp = missionNamespace getVariable ["f_var_respawnTimestamp_" + _sideStr, 0];
		_timestamps pushBack _sideTimestamp;
	};
	case "side": 
	{
		private _sideStr = [_target] call f_fnc_sideToString;
		private _sideTimestamp = missionNamespace getVariable ["f_var_respawnTimestamp_" + _sideStr, 0];
		_timestamps pushBack _sideTimestamp;
	};
};

selectMax _timestamps