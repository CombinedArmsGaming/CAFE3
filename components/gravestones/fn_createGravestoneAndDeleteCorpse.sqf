#include "macros.hpp"

params ["_deathTime", "_corpse", "_corpseName", "_obituary", "_isPriority"];


_createGravestone =
{
    params ["_corpse"];

    _corpsePos = getPosASL _corpse vectorAdd [0,0,0.5];
    _corpseDir = vectorDir _corpse;
    _groundNormal = surfaceNormal _corpsePos;

    _grave = objNull;
    _corpseParent = objectParent _corpse;

    if !(isNull _corpseParent) then
    {
        _grave = f_var_gravestoneTypeName createVehicle [0,0,0];
        _grave setVehiclePosition [(getpos _corpseParent), [], 10, "NONE"];
    }
    else
    {
        _grave = f_var_gravestoneTypeName createVehicle _corpsePos;
        _grave setVectorDirAndUp [_corpseDir,_groundNormal];
    };

    // Required check for if chosen gravestone is a backpack/vest/etc.  Thanks Cre8or.
    _innerContainers = everyContainer _grave;

    if (count _innerContainers > 0) then
    {
        _grave = _innerContainers select 0 select 1;
    };

    _grave allowDamage false;
    _grave setVariable ["ace_cookoff_enable", false, true];

    _grave

};




#ifdef ENABLE_GRAVESTONES

    if (isNull _corpse) exitWith
    {
        DEBUG_PRINT_LOG("[Gravestones] Called createGravestone but the corpse was a null object.")
    };


#ifdef GRAVESTONES_ALLOW_PRIORITY_ONLY

    if !(_isPriority) exitWith
    {
        deleteVehicle _corpse;
    };

#endif

    DEBUG_FORMAT1_LOG("[Gravestones] Creating a gravestone for corpse: %1",_corpse);

    _grave = [_corpse] call _createGravestone;

    [_grave, _corpse] call f_fnc_fillGraveAndDeleteCorpse;
    [_grave, _corpseName, _deathTime, _obituary] call f_fnc_sendGravestoneToClients;


#else

    deleteVehicle _corpse;

#endif
