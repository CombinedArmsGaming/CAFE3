#include "macros.hpp"

params ["_unit"];

//DEBUG_FORMAT2_LOG("[IDENTITY]: Attempting to apply identity.")


if (isPlayer _unit) exitWith {};

// ====================================================================================


_faction = toLower (faction _unit);

if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};


DEBUG_FORMAT2_LOG("[IDENTITY]: Attempting to apply identity for faction '%1'.",_faction)


_sideName = [_faction] call f_fnc_factionToSideName;
_identity = GET_FACTION_IDENTITY(_sideName);

_unit setVariable ["f_var_identity", _identity, true];


_speaker = selectRandom (missionNamespace getVariable "f_identities_" + _identity + "_speakers");
_face = selectRandom (missionNamespace getVariable "f_identities_" + _identity + "_faces");

_unit setSpeaker _speaker;
_unit setFace _face;
