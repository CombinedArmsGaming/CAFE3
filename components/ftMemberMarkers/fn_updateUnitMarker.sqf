// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

params ["_unit", "_markers"];

_mkrBorder = _markers select 1;
_mkr = _markers select 0;

_pos = getposATL _unit;
_dir = (direction _unit);

_mkrBorder setMarkerPosLocal _pos;
_mkrBorder setMarkerDirLocal _dir;
_mkr setMarkerPosLocal _pos;
_mkr setMarkerDirLocal _dir;

// retreives the stored color from the unit.
_mkr setMarkerColorLocal (_unit getvariable ["assignedTeam","ColorWhite"]);
