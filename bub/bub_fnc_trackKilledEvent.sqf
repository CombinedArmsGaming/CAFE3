params ["_unit"];

if (!isServer) exitWith
{
	diag_log "[TrackKills] Moving exec to server.";
	[_unit] remoteExecCall ["bub_fnc_trackKilledEvent", 2];
};

_killTracking = profileNamespace getVariable ["bub_killTracking", []];

_type = typeOf _unit;
_side = _unit getVariable ["bub_side", side group _unit];
_name = name _unit;
_position = getPos _unit;
_dir = getDir _unit;

_killReport = [_type, _side, _name, _position, _dir];

_killTracking pushBack _killReport;

diag_log format ["[TrackKills] Adding to log: %1", _killReport];
profileNamespace setVariable ["bub_killTracking", _killTracking];