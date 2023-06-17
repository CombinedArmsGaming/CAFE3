params ["_side"];

private _entries = values f_map_radioChannels;
private _preset = [_side] call f_fnc_acre_getPresetForSide;
_entries = _entries select {_x#0 isEqualTo _preset};

private _retArray = [];

{
    _retArray pushBack [_x#1, +(_x#2)];
} foreach _entries;

_retArray