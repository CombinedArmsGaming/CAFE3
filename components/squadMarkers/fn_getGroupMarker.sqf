#include "macros.hpp"

params ["_group"];

_groupName = groupId _group;
_sideName = [side leader _group] call f_fnc_sideToString;
_squadDef = SQUAD_VAR_DYNAMIC(_groupName,_sideName);
_iconOverride = "";

if !(_squadDef isEqualTo []) then
{
    _iconOverride = SQUAD_ICON(_squadDef);
};

if !(_iconOverride isEqualTo "") exitWith
{
    _iconOverride
};

_units = units _group;
_size = count _units;
_crew = _units select {!isNull objectParent _x};
_crewSize = count _crew;

if (_crewSize <= 0) exitWith
{
    "\A3\ui_f\data\Map\Markers\NATO\b_inf.paa"
};


_vehicles = [];

{
    _vehicles pushBack (objectParent _x);
    _vehicles = _vehicles call BIS_fnc_consolidateArray;

} forEach _crew;


_hasTank = false; // Tank, Tank_F, "Wheeled_APC_F"
_hasCar = false;  // Car, Car_F
_hasPlane = false; // "Plane_Base_F","Plane"
_hasHelo = false; // "Helicopter_Base_H", "Helicopter_Base_F", "Helicopter"
_hasShip = false; // "Ship_F", "Ship"

{
    _vic = _x select 0;

    _hasCar = _hasCar or {_vic isKindOf "Car"};
    _hasTank = _hasTank or {_vic isKindOf "Tank"} or {_vic isKindOf "Wheeled_APC_F"};
    _hasPlane = _hasPlane or {_vic isKindOf "Plane"};
    _hasHelo = _hasHelo or {_vic isKindOf "Helicopter"};
    _hasShip = _hasShip or {_vic isKindOf "Ship"};

} forEach _vehicles;


if (_hasShip) exitWith
{
    "\A3\ui_f\data\Map\Markers\NATO\b_naval.paa"
};

if (_hasPlane) exitWith
{
    "\A3\ui_f\data\Map\Markers\NATO\b_plane.paa"
};

if (_hasHelo) exitWith
{
    "\A3\ui_f\data\Map\Markers\NATO\b_air.paa"
};

if (_hasTank) exitWith
{
    if (_size > _crewSize) then
    {
        "\A3\ui_f\data\Map\Markers\NATO\b_mech_inf.paa"
    }
    else
    {
        "\A3\ui_f\data\Map\Markers\NATO\b_armor.paa"
    };

};

if (_hasCar) exitWith
{
    "\A3\ui_f\data\Map\Markers\NATO\b_motor_inf.paa"
};


"\A3\ui_f\data\Map\Markers\NATO\b_unknown.paa"
