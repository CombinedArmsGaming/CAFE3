#include "macros.hpp"

params ["_grave", "_corpse"];

RUN_LOCAL_TO(_corpse,f_fnc_fillGraveAndDeleteCorpse,_this);

_isContainer = [_grave, ["ReammoBox_F", "ReammoBox", "Bag_Base"]] call f_fnc_isKindOfAny;

if !(_isContainer) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] %1 is not a container.",_grave);
    deleteVehicle _corpse;
};


_loadout = getUnitLoadout _corpse;

[_grave, _loadout] call f_fnc_insertLoadoutIntoCrate;


_weaponsOnGround = nearestObjects [(ASLToAGL getPosASL _corpse), ["WeaponHolderSimulated", "GroundWeaponHolder"], 5];

_primary = _corpse getVariable ["f_var_diedWithPrimary", ""];
_secondary = _corpse getVariable ["f_var_diedWithSecondary", ""];

_types = [];

if (_primary != "") then {_types pushBack _primary};
if (_secondary != "") then {_types pushBack _secondary};

{
    _weapons = weaponsItemsCargo _x;

    if (count _weapons == 1) then
    {
        _weaponName = (_weapons select 0 select 0);

        if (_weaponName in _types) then
        {
            _types deleteAt (_types find _weaponName);
            DEBUG_FORMAT1_LOG("[Gravestones] Adding %1 to grave.",(_weapons select 0));
            [_weapons select 0, _grave] call f_fnc_addWeaponToCrate;
        };

    };

} forEach _weaponsOnGround;


deleteVehicle _corpse;
