#include "macros.hpp"

params ["_unit"];

if (isNull _unit) then
{
    systemChat "No unit found to wound.";
}
else
{
	[_unit] remoteExec ["f_fnc_zen_doWoundUnitRandomly", 2];
};
