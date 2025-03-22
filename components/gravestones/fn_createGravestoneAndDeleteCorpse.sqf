#include "macros.hpp"

params ["_deathTime", "_corpse", "_corpseName", "_obituary", "_isPriority"];


_createGravestone =
{
    params ["_corpse"];

    private _corpsePos = getPosASL _corpse vectorAdd [0,0,0.5];
    private _groundNormal = surfaceNormal _corpsePos;

    private _grave = objNull;
    private _corpseParent = objectParent _corpse;
    private _corpseBackpack = backpack _corpse;

    private _backpack = if (_corpseBackpack isNotEqualTo "") then
    {
        _corpseBackpack
    }
    else
    {
        private _faction = _corpse getVariable ["f_var_assignGear_sideName", ""];

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
        private _graveDir = vectorNormalized [(random 2) - 1, (random 2) - 1, 0];
        _grave = _backpack createVehicle _corpsePos;
        _grave setVectorDirAndUp [[1,0,0], _groundNormal];
    };

    private _graveParent = objectParent _grave;
    if (isNull _graveParent) then
    {
        _graveParent = _grave;
    };

    _graveParent setDir (random 360);

    // When using ammo crates for gravestone objects, ensure they cannot be destroyed
    _graveParent allowDamage false;
    _graveParent setVariable ["ace_cookoff_enable", false, true];

    // Update the locality transfer flag whenever ownership returns to the server (e.g. when the owning
    // client who received locality disconnects from the server)
    _graveParent addEventHandler ["Local", {
        params ["_obj"];

        _obj setVariable ["f_fnc_requestGravestoneLocality_isOnServer", local _obj, true];
    }];

    // Tell all clients to monitor the gravestone for inventory access on their end
    [_graveParent] remoteExecCall ["f_fnc_monitorGravestoneAccess", -2, true];

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
