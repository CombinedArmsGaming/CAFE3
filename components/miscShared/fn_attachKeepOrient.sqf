#include "macros.hpp"

params [["_child", objNull, [objNull]], ["_parent", objNull, [objNull]]];

LOCAL_ONLY(_child);

if !( isNull _child || isNull _parent ) then
{
    [_child, _parent] call BIS_fnc_attachToRelative;
};
