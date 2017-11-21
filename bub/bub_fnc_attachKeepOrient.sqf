params [["_child", objNull, [objNull]], ["_parent", objNull, [objNull]]];

if !( isNull _child || isNull _parent ) then
{
    private _vDir = vectorDir _child;
    private _vUp = vectorUp _child;
    _child attachTo [_parent];
    _child setVectorDirAndUp [_vDir, _vUp];
};