/*
	Created By: Gibbs
*/
#include "../macros.hpp"

CLIENT_ONLY;

params ["_object"];

if (isNull _object) then
{
    ["No unit found to remove jammers from."] call zen_common_fnc_showMessage;
}
else
{
	[_object] remoteExec ["f_fnc_removeJammersFromObject", 2];
    ["Removing jammers from '%1'.", _object] call zen_common_fnc_showMessage;
};
