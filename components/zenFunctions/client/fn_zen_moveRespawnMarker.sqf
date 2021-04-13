#include "macros.hpp"

params ["_position"];


	["Move Respawn Marker", 
	[
		["SIDE", "Side", [[0, 1, 2, 3], ["WEST", "EAST", "INDEPENDENT", "CIVILIAN"], 0]],
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_side"];
		_args params ["_position"];

        _sideStr = str _side;
        _markerName = toLower ("respawn_" + _sideStr);

        if (getMarkerColor _markerName isEqualTo "") then
        {
            _marker = createMarker [_markerName, _position];
            _marker setMarkerAlpha 0;

            systemChat format ["Created marker '%1' at given position.", _markerName];
        }
        else
        {
            _markerName setMarkerPos _position;
            systemChat format ["Moved marker '%1' to given position.", _markerName];
        };

	}, 
	{},
	[_object]] call zen_dialog_fnc_create;
