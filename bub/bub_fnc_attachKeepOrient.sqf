params [["_child", objNull, [objNull]], ["_parent", objNull, [objNull]]];

if !( isNull _child || isNull _parent ) then
{
    [_child, _parent] call BIS_fnc_attachToRelative;
};