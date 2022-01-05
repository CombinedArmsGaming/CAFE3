#include "macros.hpp"

/*
    Args:
        0: Unit to modify
        1: Name of identity to apply.
*/

params ["_unit", "_identity"];

_speakers = GET_SPEAKERS_FOR_IDENTITY_DYNAMIC(_identity);
_faces = GET_FACES_FOR_IDENTITY_DYNAMIC(_identity);
_names = GET_NAMES_FOR_IDENTITY_DYNAMIC(_identity);

_uid = _unit call f_fnc_getObjectUid;

_name = [_names, _uid] call f_fnc_generateName;

_unit setSpeaker (_speakers select (floor (_uid random (count _speakers))));
_uid = _uid * 2;
_unit setFace (_faces select (floor (_uid random (count _faces))));

_unit setName _name;
_unit setNameSound "";

if (local _unit) then
{
    [_unit] call ace_common_fnc_setName;
};
