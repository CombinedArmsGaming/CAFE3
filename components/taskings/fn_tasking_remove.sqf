_taskList = player call BIS_fnc_tasksUnit;
if (count _taskList > 0) then
{
    ["Remove Tasking", 
        [
            ["COMBO", "Task", [_taskList,_taskList]]
        ],
        {
            params ["_dialogValues", "_arguments"];
            _dialogValues params ["_taskName", "_taskState"];
            [_taskName, true, true] call BIS_fnc_deleteTask;
        }, 
        {},
        []
    ] call zen_dialog_fnc_create;
}
else
{
    ["No Taskings to remove."] call zen_common_fnc_showMessage;
};