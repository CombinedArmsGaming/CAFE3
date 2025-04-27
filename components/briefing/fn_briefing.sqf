// CAFE - Briefing
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================

#include "macros.hpp"
CLIENT_ONLY;


DEBUG_PRINT_LOG("running f_briefing")

WAIT_UNTIL_PLAYER_EXISTS();
WAIT_UNTIL_SETTINGS_READY();


// Add framework briefing panel.
#include "briefings\ca_briefing_framework.sqf";


// ====================================================================================

// DETECT PLAYER FACTION
// The following code detects what side the player's slot belongs to, and stores
// it in the private variable _unitSide

_unitSide = side group player;

DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Player faction: %1", _unitSide)

#include "briefings\ca_briefing_player.sqf";
#include "briefings\ca_briefing_respawn.sqf";

// ====================================================================================

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (serverCommandAvailable "#kick") then
{

#include "briefings\part_briefing_admin.sqf"

#include "briefings\ca_briefing_admin.sqf";

	DEBUG_PRINT_CHAT("DEBUG (briefing.sqf): Briefing for host selected.")
};

// ====================================================================================

// BRIEFING: WEST
// The following block of code executes only if the player is in a BLU slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitSide == west) exitWith
{
#include "..\..\configuration\briefings\part_briefing_west.sqf"

	DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Briefing for %1 slot selected.", _unitSide)
};

// ====================================================================================

// BRIEFING: EAST
// The following block of code executes only if the player is in a OPF slot; it
// automatically includes a file which contains the appropriate briefing data.

if (_unitSide == east) exitWith
{
#include "..\..\configuration\briefings\part_briefing_east.sqf"

	DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Briefing for %1 slot selected.", _unitSide)
};
// ====================================================================================

// BRIEFING: INDEPENDENT
// The following block of code executes only if the player is in a GUER
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitSide == resistance) exitWith
{
#include "..\..\configuration\briefings\part_briefing_resistance.sqf"

	DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Briefing for %1 slot selected.", _unitSide)
};

// ====================================================================================

// BRIEFING: CIVILIAN
// The following block of code executes only if the player is in a CIVILIAN
// slot; it automatically includes a file which contains the appropriate briefing data.

if (_unitSide == civilian) exitWith
{
#include "..\..\configuration\briefings\part_briefing_civ.sqf"

	DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Briefing for %1 slot selected.", _unitSide)
};



// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

DEBUG_FORMAT1_CHAT("DEBUG (briefing.sqf): Side %1 is not defined.", _unitSide)
