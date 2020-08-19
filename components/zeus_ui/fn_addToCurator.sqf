#include "macros.hpp"

RUN_ON_SERVER(f_fnc_addToCurator,_this);

params [["_group", grpNull], ["_vehicle", objNull]];

// Add the units as editable objects
private _allObjects = (units _group) + [_vehicle];
{
	_x addCuratorEditableObjects [_allObjects, true];
} forEach allCurators;
