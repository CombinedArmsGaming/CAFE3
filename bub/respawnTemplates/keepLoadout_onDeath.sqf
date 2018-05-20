// CA respawn system with wave respawns

if (isDedicated) exitWith{};


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player; !isnil {ca_initserver};};
};

params ["_unit","_killer"];

if (!local _unit) exitWith{};

_loadout = getUnitLoadout _unit;

missionNamespace setVariable ["ca_oldLoadout", _loadout];