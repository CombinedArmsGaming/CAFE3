// CA - Respawn briefing section
// ====================================================================================

private _briefing = "";
private _side = side player;

private _respawnModeTimedText = str RESPAWN_MODE_TIMED;
private _respawnModeTimedTicketsText = str RESPAWN_MODE_TIMED_TICKETS;
private _respawnModeTimedWavesText = str RESPAWN_MODE_TIMED_WAVES;
private _respawnModeTicketsText = str RESPAWN_MODE_TICKETS;
private _respawnModeTimedWavesTicketsText = str RESPAWN_MODE_TIMED_WAVES_TICKETS;
private _respawnModeTriggeredWavesText = str RESPAWN_MODE_TRIGGERED_WAVES;
private _respawnModeTriggeredWavesTicketsText = str RESPAWN_MODE_TRIGGERED_WAVES_TICKETS;

// Defaults for if macros are not defined
private _delay = "Not set";
private _modeName = "Not set";
private _sideTickets = "Not set";
private _individualTickets = "Not set";
private _mode = null;

if (_side == west) then {
#ifdef RESPAWN_DELAY_BLUFOR
	_delay = RESPAWN_DELAY_BLUFOR;
#endif
#ifdef RESPAWN_MODE_BLUFOR
	_mode = str RESPAWN_MODE_BLUFOR;
#endif
#ifdef RESPAWN_SIDE_TICKETS_BLUFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_BLUFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_BLUFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_BLUFOR;
#endif
};

if (_side == east) then {
#ifdef RESPAWN_DELAY_OPFOR
	_delay = RESPAWN_DELAY_OPFOR;
#endif
#ifdef RESPAWN_MODE_OPFOR
	_mode = str RESPAWN_MODE_OPFOR;
#endif
#ifdef RESPAWN_SIDE_TICKETS_OPFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_OPFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_OPFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_OPFOR;
#endif
};

if (_side == independent) then {
#ifdef RESPAWN_DELAY_INDFOR
	_delay = RESPAWN_DELAY_INDFOR;
#endif
#ifdef RESPAWN_MODE_INDFOR
	_mode = str RESPAWN_MODE_INDFOR;
#endif
#ifdef RESPAWN_SIDE_TICKETS_INDFOR
	_sideTickets = RESPAWN_SIDE_TICKETS_INDFOR;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_INDFOR
	_individualTickets = RESPAWN_PLAYER_TICKETS_INDFOR;
#endif
};

if (_side == civilian) then {
#ifdef RESPAWN_DELAY_CIVILIAN
	_delay = RESPAWN_DELAY_CIVILIAN;
#endif
#ifdef RESPAWN_MODE_CIVILIAN
	_mode = str RESPAWN_MODE_CIVILIAN;
#endif
#ifdef RESPAWN_SIDE_TICKETS_CIVILIAN
	_sideTickets = RESPAWN_SIDE_TICKETS_CIVILIAN;
#endif
#ifdef RESPAWN_PLAYER_TICKETS_CIVILIAN
	_individualTickets = RESPAWN_PLAYER_TICKETS_CIVILIAN;
#endif
};

switch _mode do 
{
	case _respawnModeTimedText: 
	{
		_modeName = RESPAWN_MODE_NAME_TIMED;
	};
	case _respawnModeTimedTicketsText: 
	{
		_modeName = RESPAWN_MODE_NAME_TIMED_TICKETS;
	};
	case _respawnModeTimedWavesText: 
	{
		_modeName = RESPAWN_MODE_NAME_TIMED_WAVES;
	};
	case _respawnModeTicketsText: 
	{
		_modeName = RESPAWN_MODE_NAME_TICKETS;
	};
	case _respawnModeTimedWavesTicketsText: 
	{
		_modeName = RESPAWN_MODE_NAME_TIMED_WAVES_TICKETS;
	};
	case _respawnModeTriggeredWavesText: 
	{
		_modeName = RESPAWN_MODE_NAME_TRIGGERED_WAVES;
	};
	case _respawnModeTriggeredWavesTicketsText: 
	{
		_modeName = RESPAWN_MODE_NAME_TRIGGERED_WAVES_TICKETS;
	};
	default
	{
		_modeName = "Not set";
	};
};

_briefing = _briefing + format ["
	Respawn Mode: %1
	<br/>
	Respawn Delay: %2
	<br/>
	Respawn Tickets (Side): %3
	<br/>
	Respawn Tickets (Per-Player): %4
	<br/>
", _modeName, _delay, _sideTickets, _individualTickets];

player createDiaryRecord ["CAFE", ["Current Respawn Settings", _briefing]];