// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

params ["_unit"];

// DECLARE PRIVATE VARIABLES

private ["_unit","_mkrType","_mkrColor","_mkrName","_mkr","_mkrBorder","_pos"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

_mkrName = format ["mkr_%1",_unit];
_mkrborderName = format ["mkrB_%1",_unit];

// ====================================================================================

// CREATE MARKERS

// this marker is slightly bigger and abused in such a way to make it seem like the next maker has a border
_pos = getposATL _unit;
_mkrBorder = createMarkerLocal [_mkrborderName,_pos];
_mkrBorder setMarkerShapeLocal "ICON";
_mkrBorder setMarkerTypeLocal "MIL_TRIANGLE";
_mkrBorder setMarkerColorLocal "ColorBlack";
_mkrBorder setMarkerSizeLocal [0.60, 0.60];
_mkrBorder setMarkerDirLocal (direction _unit);

// This marker is the real marker
_mkr = createMarkerLocal [_mkrName,_pos];
_mkr setMarkerShapeLocal "ICON";
_mkr setMarkerTypeLocal "MIL_TRIANGLE";
_mkr setMarkerColorLocal (_unit getvariable ["assignedTeam","ColorWhite"]);
_mkr setMarkerSizeLocal [0.45, 0.45];
_mkr setMarkerDirLocal (direction _unit);

[_mkr, _mkrBorder]
