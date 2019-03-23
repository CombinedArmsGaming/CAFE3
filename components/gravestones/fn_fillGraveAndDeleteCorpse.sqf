#include "macros.hpp"

params ["_grave", "_corpse"];

RUN_LOCAL_TO(_corpse,f_fnc_fillGraveAndDeleteCorpse,_this);

_isContainer = [_grave] call f_fnc_isContainer;

if !(_isContainer) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] %1 is not a container.",_grave);
    deleteVehicle _corpse;
};


clearWeaponCargoGlobal _grave;
clearMagazineCargoGlobal _grave;
clearItemCargoGlobal _grave;
clearBackpackCargoGlobal _grave;


_loadout = getUnitLoadout _corpse;

[_grave, _loadout] call f_fnc_insertLoadoutIntoCrate;


_primary = _corpse getVariable ["f_var_diedWithPrimary", ""];
_secondary = _corpse getVariable ["f_var_diedWithSecondary", ""];

_types = [];

if (_primary != "") then {_types pushBack _primary};
if (_secondary != "") then {_types pushBack _secondary};

if (count _types <= 0) exitWith
{
    deleteVehicle _corpse;
};

_corpsePos = (ASLToAGL getPosASL _corpse);
_weaponsOnGround = nearestObjects [_corpsePos, ["WeaponHolderSimulated", "GroundWeaponHolder"], 5];

{
    _weapons = weaponsItemsCargo _x;

    if (count _weapons == 1) then
    {
        _weaponName = (_weapons select 0 select 0);

        if (_weaponName in _types) then
        {
            _types deleteAt (_types find _weaponName);
            [_weapons select 0, _grave] call f_fnc_addWeaponToCrate;
        };

    };

} forEach _weaponsOnGround;


deleteVehicle _corpse;
