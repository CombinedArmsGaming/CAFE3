#include "macros.hpp"

params ["_unit"];

if (isPlayer _unit) exitWith {};

_faction = toLower (faction _unit);

/*
// For future use - allows faction override, gearscript-style.
if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};
*/

_sideName = [_faction] call f_fnc_factionToSideName;

DEBUG_FORMAT1_LOG("[IDENTITY]: Attempting to apply identity for sideName %1.",_sideName)

_identity = GET_FACTION_IDENTITY_DYNAMIC(_sideName);

_unit setVariable ["f_var_identity", _identity, true];

_speakers = GET_SPEAKERS_FOR_IDENTITY_DYNAMIC(_identity);
_faces = GET_FACES_FOR_IDENTITY_DYNAMIC(_identity);
_names = GET_NAMES_FOR_IDENTITY_DYNAMIC(_identity);

_uid = _unit call f_fnc_getObjectUid;

_name = [_names, _uid] call f_fnc_generateName;

_unit setSpeaker (_speakers select (floor (_uid random (count _speakers))));
_objectUid = _objectUid * 2;
_unit setFace (_faces select (floor (_uid random (count _faces))));

_unit setName _name;
_unit setNameSound "";
