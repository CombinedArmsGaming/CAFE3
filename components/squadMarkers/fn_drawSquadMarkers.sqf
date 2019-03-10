#include "macros.hpp"

if (isNil 'f_arr_squadMarkers') exitWith {};
if (IS_TRUE(f_var_hideSquadMarkers)) exitWith {};

params ["_map"];


// NOTE: Only supports custom textures (in mission folder).
_drawMarker =
{
	params ["_map", "_icon", "_name", "_colour", "_pos"];

	_map drawIcon
	[
		format ["%1%2",MISSION_ROOT,_icon],
		_colour,
		_pos,
		32,
		32,
		0,
		_name,
		2
	];

};


{
	_x params ["_group", "_icon", "_name", "_colour"];

	if !(isNull _group or {count units _group <= 0}) then
	{
		_pos = getPos leader _group;

		[_map, _icon, _name, _colour, _pos] call _drawMarker;

	};

} forEach f_arr_squadMarkers;
