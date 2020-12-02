#include "macros.hpp"

params ["_unit"];

DEBUG_FORMAT2_LOG("[IDENTITY]: Attempting to apply identity.")


// if (isPlayer _unit) exitWith {};

// // ====================================================================================


// _faction = toLower (faction _unit);

// if (count _this > 2) then
// {
//     _faction = toLower (_this select 2);
// };


// DEBUG_FORMAT2_LOG("[IDENTITY]: Attempting to apply identity for faction '%1'.",_faction);


// // ====================================================================================

// _unit setVariable ["f_var_identity_Faction", _faction, true];

// // ====================================================================================

// _identityVariant = [_faction] call f_fnc_factionToIdentityVariant;
// _identityVariant = "limey";
// if (_gearVariant == "") exitWith
// {
//     DEBUG_FORMAT2_LOG("[IDENTITY]: Exited early because faction variant could not be resolved (Unit %1, Faction %2)",(str _unit),_faction);
// };

// //_identity = IDENTITY_VAR(_identityVariant);


// _speaker = selectRandom SPEAKERS(_identityVariant);
// _face = selectRandom FACES(_identityVariant);

// _unit setSpeaker _speaker;
// _unit setFace _face;
