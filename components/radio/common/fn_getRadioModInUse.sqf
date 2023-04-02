params ["_side"];

if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
	"ACRE"
}
else
{
	if (["task_force_radio"] call ace_common_fnc_isModLoaded) then 
	{
		"TFAR"
	}
	else
	{
		""
	}
}