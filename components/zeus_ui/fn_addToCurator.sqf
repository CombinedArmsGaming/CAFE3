#include "macros.hpp"

RUN_ON_SERVER(f_fnc_addToCurator,_this);

params [["_group", grpNull], ["_vehicle", objNull]];


// Generate a flat list of all objects to add to curators.
private _allObjects = [];

{
	_newObjects = switch (typeName _x) do
	{
		case ("GROUP"): {units _x};
		case ("ARRAY"): {_x};
	    default {[_x]};
	};

	_allObjects = _allObjects + _newObjects;

} forEach _this;


// Add the units as editable objects.
{
	_x addCuratorEditableObjects [_allObjects, true];
} forEach allCurators;
