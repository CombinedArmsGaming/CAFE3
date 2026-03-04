[
	"Ceasefire",
	[
		["CHECKBOX", "Is active", true],
		["SLIDER", "Duration (in seconds; 0 = infinite)", [0, 300, 0, 0]],
		["EDIT", "Justification text", ""]
	],
	{
		params ["_dialogArgs"];
		_dialogArgs remoteExecCall ["f_fnc_ceasefire", 2, false];
	},
	{},
	[]
] call zen_dialog_fnc_create;
