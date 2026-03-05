#include "macros.hpp"
/*
    Update the tooltip of the tickets info in the spawn picker dialog
*/

disableSerialization;

params ["_display"];

if (!(missionNamespace getVariable ["f_var_spawnPickerDialog_isOpened", false])) exitWith {
    DEBUG_PRINT_LOG("[RESPAWN] updateTickets aborted as spawn picker dialog is not open");
};

_ticketsCtrl = _display displayCtrl IDC_TICKETS_TEXT;

_playerTickets = [player, 0, false] call bis_fnc_respawnTickets;
_sideTickets = [playerSide, 0, false] call bis_fnc_respawnTickets;
// Unlikely to have group tickets since there's no support for it in the config, but zeus could add it mid-mission.
// Only displayed if non-zero for that reason
// Ideally it doesn't happen, it's weird.
_groupTickets = [group player, 0, false] call bis_fnc_respawnTickets;

private _str = format ["Personal tickets: %1", (_playerTickets max 0)];
if (_groupTickets > 0) then {
    _str = _str + format ["\nGroup tickets: %1", _groupTickets];
// If group tickets are set, it looks like they kind of merge with side tickets
} else {
    _str = _str + format ["\nSide tickets: %1",(_sideTickets max 0)];
};



_ticketsCtrl ctrlSetText _str;
if (_playerTickets <= 0 and _sideTickets <= 0 and _groupTickets <= 0) then {
	_ticketsCtrl ctrlSetTextColor [1, 0, 0, 1];
};