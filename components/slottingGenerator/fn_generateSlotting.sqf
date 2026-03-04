private _westSlots = [west] call f_fnc_generateSlottingForSide;
private _indSlots = [resistance] call f_fnc_generateSlottingForSide;
private _eastSlots = [east] call f_fnc_generateSlottingForSide;
private _civSlots = [civilian] call f_fnc_generateSlottingForSide;

private _arrayStructure = [_westSlots, _indSlots, _eastSlots, _civSlots] call f_fnc_generateSlottingBoilerplate;

private _jsonFragments = [_arrayStructure] call f_fnc_composeJSONObjectFragments;

_jsonFragments joinString "";