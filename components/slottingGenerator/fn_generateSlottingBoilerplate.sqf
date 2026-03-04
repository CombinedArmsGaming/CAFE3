params ["_groupsWest","_groupsInd","_groupsEast","_groupsCiv"];

private _sidesArray = [];

if (_groupsWest isNotEqualTo []) then
{
	_sidesArray pushBack 
	[
		["side", "BLU"],
		["groups", _groupsWest]
	];
};

if (_groupsInd isNotEqualTo []) then
{
	_sidesArray pushBack 
	[
		["side", "IND"],
		["groups", _groupsInd]
	];
};

if (_groupsEast isNotEqualTo []) then
{
	_sidesArray pushBack 
	[
		["side", "RED"],
		["groups", _groupsEast]
	];
};

if (_groupsCiv isNotEqualTo []) then
{
	_sidesArray pushBack 
	[
		["side", "CIV"],
		["groups", _groupsCiv]
	];
};

[
	[
		"event",
		[
			["event_date", "2000-01-01T20:00:00Z"],
			["event_title", getMissionConfigValue "onLoadName"],
			["event_desc", "-- insert google docs link here --"],
			["event_owner", getMissionConfigValue "author"],
			["event_reserves", []],
			["event_repo", "MAIN"]
		]
	],
	[
		"sides",
		_sidesArray
	]
]
