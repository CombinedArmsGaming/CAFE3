#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if (isNull _unit) then
{
    ["No unit found to wound."] call zen_common_fnc_showMessage;
}
else
{
	_group = group _unit;
	{
		[_x] remoteExec ["f_fnc_woundUnitRandomly", 2];
	} foreach units _group;

};
