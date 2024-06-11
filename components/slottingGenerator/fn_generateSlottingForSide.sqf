params [["_side", sideUnknown, [west]]];

if (_side isEqualTo sideUnknown) then {throw "Supported sides are west, east, independent, civilian."};

private _playableUnits = playableUnits;

private _leaderGroups = allGroups select {side _x isEqualTo _side};
_leaderGroups = _leaderGroups select {leader _x in _playableUnits};
_leaderGroups = _leaderGroups select {(leader _x) getVariable ["f_leaderGroup", false]};

_leaderGroups apply {[_x, true] call f_fnc_generateGroupSlotting}