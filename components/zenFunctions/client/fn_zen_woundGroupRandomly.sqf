#include "macros.hpp"

params ["_unit"];

if (isNull _unit) then
{
    systemChat "No unit found to wound.";
}
else
{
	_group = group _unit;
	{
		[_x] remoteExec ["f_fnc_zen_doWoundUnitRandomly", 2];
	} foreach units _group;

};
