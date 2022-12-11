
private _ticketsRemaining = [player, 0, true] call BIS_fnc_respawnTickets;
if (_ticketsRemaining <= 0) then
{
    [player, 1, false] call BIS_fnc_respawnTickets;
};

setPlayerRespawnTime 0;