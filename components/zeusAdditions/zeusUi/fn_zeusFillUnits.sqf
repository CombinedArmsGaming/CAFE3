//	Zeus extensions for CA, by Bubbus.
//
//	Fills the unit spawn list with squad definitions from zeusNpcSpawner config.
//
//	PARAMETERS:
//
//		_listIDC
//			The control ID for the on-screen unit spawn list.
//
//		_categoryIdx
//			The index of the user's currently selected unit category, as defined in zeusNpcSpawner config.

if (isDedicated) exitWith {};

params ["_listIDC", "_categoryIdx"];


[_listIDC] call f_fnc_clearList;

_unitsList = (findDisplay 312) displayCtrl _listIDC;
_unitsList lbSetCurSel -1;
f_zeus_defToSpawn = nil;

_units = f_zeus_unitsStructure;

_category = _units select _categoryIdx;
_type = _category select 1;
_gear = _category select 2;
_side = _category select 3;
_defs = _category select 4;

_listDefs = [];

switch (_type) do
{
	case "inf":
	{
		{
			_name = _x select 0;
			_def = [_type, _x select 1, _gear, _side];

			[_listIDC, _name] call f_fnc_addToList;

			_listDefs pushBack _def;

		} forEach _defs;

	};

	case "veh":
	{
		{
			_name = _x select 0;
			_def = [_type, _x select 2, _x select 1, _gear, _side];

			[_listIDC, _name] call f_fnc_addToList;

			_listDefs pushBack _def;

		} forEach _defs;

	};

};

f_zeus_listUnits = _listDefs;
