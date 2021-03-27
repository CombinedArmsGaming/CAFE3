#include "macros.hpp"

params ["_deathTime", "_corpse", "_corpseName", "_obituary", "_isPriority"];


_createGravestone =
{
    params ["_corpse"];

    _corpsePos = getPosASL _corpse vectorAdd [0,0,0.5];
    _groundNormal = surfaceNormal _corpsePos;

    _grave = objNull;
    _corpseParent = objectParent _corpse;
    _corpseBackpack = backpack _corpse;

    _backpack = if (_corpseBackpack isNotEqualTo "") then
    {
        _corpseBackpack
    }
    else
    {
        _faction = _corpse getVariable ["f_var_assignGear_sideName", ""];

        if (_faction isEqualTo "") then
        {
            f_var_gravestoneTypeName
        }
        else
        {
            missionNamespace getVariable ["f_var_gravestoneTypeName_" + _faction, f_var_gravestoneTypeName]
        };
    };

    if !(isNull _corpseParent) then
    {
        _grave = _backpack createVehicle [0,0,0];
        _grave setVehiclePosition [(getpos _corpseParent), [], 10, "NONE"];
    }
    else
    {
        _graveDir = vectorNormalized [(random 2) - 1, (random 2) - 1, 0];
        _grave = _backpack createVehicle _corpsePos;
        _grave setVectorDirAndUp [[1,0,0], _groundNormal];
    };

    _graveParent = objectParent _grave;

    if !(isNull _graveParent) then
    {
        _graveParent setDir (random 360);
    }
    else
    {
        _grave setDir (random 360);
    };

    // Required check for if chosen gravestone is a backpack/vest/etc.  Thanks Cre8or.
    _innerContainers = everyContainer _grave;

    if (count _innerContainers > 0) then
    {
        _grave = _innerContainers select 0 select 1;
    };

    _grave setDir (random 360);
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
