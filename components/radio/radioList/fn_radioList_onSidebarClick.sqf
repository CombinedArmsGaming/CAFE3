params ["_ctrl"];

private _ctrlGroup = ctrlParentControlsGroup _ctrl;
if (isNull _ctrlGroup) exitWith {};

private _isExpanded = _ctrlGroup getVariable ["f_var_expanded", true];

if (_isExpanded) then
{
	_ctrlGroup ctrlSetPosition 
	[
		(safeZoneW + safeZoneX) - (safeZoneW * 0.025),
		safeZoneY + (safeZoneH * 0.04)
	];
}
else
{
	_ctrlGroup ctrlSetPosition 
	[
		(safeZoneW + safeZoneX) - (safeZoneW * 0.2),
		safeZoneY + (safeZoneH * 0.04)
	];
};

_ctrlGroup ctrlCommit 0.3;
_ctrlGroup setVariable ["f_var_expanded", !_isExpanded];

_ctrl ctrlSetText ([">>", "<<"] select _isExpanded);
_ctrl ctrlCommit 0;