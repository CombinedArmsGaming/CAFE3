params ["_unit"];

if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
	+(_this call f_fnc_acre_getRadioConfigForUnit)
}