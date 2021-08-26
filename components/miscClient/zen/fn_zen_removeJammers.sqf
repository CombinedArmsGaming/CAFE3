/*
	Created By: Gibbs
*/
#include "macros.hpp"

params ["_object"];

if (isNull _object) then
{
    ["No unit found to remove jammers from."] call zen_common_fnc_showMessage;
}
else
{
	[_object] remoteExec ["f_fnc_removeJammersFromObject", 2];
};
