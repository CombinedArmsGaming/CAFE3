params ["_group", ["_recursive",false,[true]], ["_encountered",[],[[]]]];

private _groupName = groupId _group;

private _unitDetails = (units _group) apply {_x call f_fnc_generatePlayerSlotting};

private _childArray = [];

if (_recursive isEqualTo true) then
{
	_encountered pushBack _group;

	private _linkedTo = (synchronizedObjects leader _group) apply {group _x};
	_linkedTo = _linkedTo select {_x isNotEqualTo grpNull};
	_linkedTo = _linkedTo select {!(_x in _encountered)};
	
	private _sortingArray = _linkedTo apply {[groupId _x, _x]};
	_sortingArray sort true;

	_linkedTo = _sortingArray apply {_x#1};

	_childArray = _linkedTo apply {[_x, true, _encountered] call f_fnc_generateGroupSlotting};
};

[
	["group_data", 
		[
			["group_name", _groupName],
			["group_orbat_icon", "nato_inf"],
			["group_gear", ""],
			["group_callsign", _groupName],
			["group_background", "WHITE"]
		]
	],
	["slots", _unitDetails],
	["child", _childArray]
]