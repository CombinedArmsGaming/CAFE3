params ["_trigger"];

_existingMarker = _trigger getVariable ["f_var_spawnerMarkerName", ""];

if (_existingMarker isNotEqualTo "") exitWith {};

private _area = triggerArea _trigger;
private _isRectangle = _area # 3;

private _markerCenter = getPos _trigger;

private _markerName = "spawnerMarker_" + (vehicleVarName _trigger);
createMarker [_markerName, _markerCenter];
_markerName setMarkerShapeLocal (["ELLIPSE", "RECTANGLE"] select _isRectangle);
_markerName setMarkerBrushLocal "Border";
_markerName setMarkerColorLocal "ColorBlack";
_markerName setMarkerAlphaLocal 0.75;
_markerName setMarkerDirLocal (_area # 2);
_markerName setMarkerSize [_area # 0, _area # 1];

_trigger setVariable ["f_var_spawnerMarkerName", _markerName, true];