_taskList = player call BIS_fnc_tasksUnit;
["Create Tasking", 
	[
		["SIDES", "Tasking for...", WEST], //_taskingSide
		["EDIT", "Tasking Name/ID"], //_taskingName
		["CHECKBOX", "Has parent?", false], //_hasParent
		["COMBO", "Parent Tasking", [_taskList,_taskList]], //_parentTasking
		["COMBO", "Initial State", [["CREATED", "ASSIGNED", "SUCCEEDED", "FAILED", "CANCELED"],["Created", "Assigned", "Succeeded", "Failed", "Cancelled"]]], //_initialState
		["EDIT:MULTI", "Task Description"] //_taskingDescription
	],
	{
		//On Confirm
		params ["_dialogValues"];
		_dialogValues params ["_taskingSide", "_taskingName", "_hasParent", "_parentTasking", "_initialState", "_taskingDescription"];
		if (_hasParent) then
		{
			[west, [_taskingName, _parentTasking], [_taskingDescription, _taskingName, "void"], objNull, _initialState] call BIS_fnc_taskCreate;
		}
		else
		{
			[_taskingSide, _taskingName, [_taskingDescription, _taskingName, "void"], objNull, _initialState] call BIS_fnc_taskCreate;
		};
	}, 
	{},
	[]
] call zen_dialog_fnc_create;