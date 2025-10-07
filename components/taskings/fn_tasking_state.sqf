_taskList = player call BIS_fnc_tasksUnit;
if (count _taskList > 0) then
{
    ["Set Tasking State", 
        [
            ["COMBO", "Task", [_taskList,_taskList]],
            ["COMBO", "State", [["CREATED", "ASSIGNED", "SUCCEEDED", "FAILED", "CANCELED"],["Created", "Assigned", "Succeeded", "Failed", "Cancelled"]]]
        ],
        {
            params ["_dialogValues", "_arguments"];
            _dialogValues params ["_taskName", "_taskState"];
            [_taskName, _taskState] call BIS_fnc_taskSetState;
        }, 
        {},
        []
    ] call zen_dialog_fnc_create;
}
else
{
    ["No Taskings to list."] call zen_common_fnc_showMessage;
};