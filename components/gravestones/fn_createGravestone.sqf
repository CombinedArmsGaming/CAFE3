#include "macros.hpp"

params ["_deathTime", "_corpse", "_corpseName"];


if (isNull _corpse) exitWith
{
    DEBUG_PRINT_LOG("[Gravestones] Called createGravestone but the corpse was a null object.")
};


DEBUG_FORMAT1_LOG("[Gravestones] Creating a gravestone for corpse: %1",_corpse);

_corpsePos = getPosASL _corpse vectorAdd [0,0,0.5];
_corpseDir = vectorDir _corpse;
_groundNormal = surfaceNormal _corpsePos;

//_grave = createSimpleObject ["a3\structures_f_epb\civ\dead\grave_dirt_f.p3d", _corpsePos];
_grave = f_var_gravestoneTypeName createVehicle _corpsePos;
_grave setVectorDirAndUp [_corpseDir,_groundNormal];

[_grave, _corpse] call f_fnc_fillGraveAndDeleteCorpse;

[_grave, _corpseName, _deathTime, ""] call f_fnc_sendGravestoneToClients;
