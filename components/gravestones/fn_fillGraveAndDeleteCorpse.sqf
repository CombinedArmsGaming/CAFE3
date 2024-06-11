#include "macros.hpp"

params ["_grave", "_corpse"];

RUN_LOCAL_TO(_corpse,f_fnc_fillGraveAndDeleteCorpse,_this);

private _isContainer = [_grave] call f_fnc_isContainer;

if !(_isContainer) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] %1 is not a container.",_grave);
    deleteVehicle _corpse;
};


clearWeaponCargoGlobal _grave;
clearMagazineCargoGlobal _grave;
clearItemCargoGlobal _grave;
clearBackpackCargoGlobal _grave;


private _loadout = getUnitLoadout _corpse;

[_grave, _loadout] call f_fnc_insertLoadoutIntoCrate;

private _primary = _corpse getVariable ["f_var_diedWithPrimary", ""];
private _secondary = _corpse getVariable ["f_var_diedWithSecondary", ""];

private _types = [];

if (_primary != "") then {_types pushBack _primary};
if (_secondary != "") then {_types pushBack _secondary};

if (count _types <= 0) exitWith
{
    deleteVehicle _corpse;
};

private _corpsePos = (ASLToAGL getPosASL _corpse);
private _weaponsOnGround = nearestObjects [_corpsePos, ["WeaponHolderSimulated", "GroundWeaponHolder"], 5];

{
    private _weapons = weaponsItemsCargo _x;

    if (count _weapons != 1) then {continue};
    private _weapon = _weapons # 0;
    private _weaponName = _weapon # 0;

    if !(_weaponName in _types) then {continue};

    _types deleteAt (_types find _weaponName);
    _grave addWeaponWithAttachmentsCargoGlobal [_weapon, 1];

} forEach _weaponsOnGround;


deleteVehicle _corpse;
