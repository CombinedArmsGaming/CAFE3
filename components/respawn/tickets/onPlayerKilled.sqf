#include "macros.hpp"

/*
	CAFE Tickets on-killed script.

	Disable respawn if no tickets remain, then wait until any tickets are added to re-enable respawn.
*/

params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

// Wait until a ticket is gained or player is alive.  Re-enable respawn if ticket is gained.
// If player does not respawn and tickets run out again, re-disable respawn and await further tickets.
f_fnc_respawn_tickets_waitForTickets = 
{
	[
		// Condition
		{
			(alive player) or {([player, 0, true] call bis_fnc_respawnTickets) > 0}
		},

		// Script
		{
			if (alive player) exitWith {};

			DEBUG_FORMAT1_LOG("[RESPAWN-2] %1 has tickets now - removing the wait.", player)
			setPlayerRespawnTime 1;
			[] call f_fnc_respawn_tickets_waitForNoTickets;
		}

	] call CBA_fnc_waitUntilAndExecute;
};

// Wait until all tickets are lost or player is alive.  Re-disable respawn if tickets are lost.
// If player does not respawn and tickets are gained, re-enable respawn and await further ticket depletion.
f_fnc_respawn_tickets_waitForNoTickets = 
{
	[
		// Condition
		{
			(alive player) or {([player, 0, true] call bis_fnc_respawnTickets) <= 0}
		},

		// Script
		{
			if (alive player) exitWith {};

			DEBUG_FORMAT1_LOG("[RESPAWN-2] %1 has no more tickets now - re-applying the wait.", player)
			setPlayerRespawnTime 1e10;
			[] call f_fnc_respawn_tickets_waitForTickets;
		}

	] call CBA_fnc_waitUntilAndExecute;
};


// Check if tickets are available, and poll for ticket gain or ticket depletion accordingly.
private _remainingTickets = [player, 0, true] call bis_fnc_respawnTickets;

if (_remainingTickets > 0) then
{	
	DEBUG_FORMAT2_LOG("[RESPAWN-2] %1 has %2 tickets remaining - not enforcing a wait.", player, _remainingTickets)
	[] call f_fnc_respawn_tickets_waitForNoTickets;
}
else
{
	DEBUG_FORMAT2_LOG("[RESPAWN-2] %1 has %2 tickets remaining - enforcing a wait.", player, _remainingTickets)
	setPlayerRespawnTime 1e10;
	[] call f_fnc_respawn_tickets_waitForTickets;
};

