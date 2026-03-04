#include "../macros.hpp"


private _onConfirm = {
	params ["_values", "_args"];
	// These are passed at the end of this file and then through the dialog to here
	_args params ["_position", "_object"];

	// ZEN gives an array of responses, we only care about the first
	private _toRespawn = _values # 0;

	[_position, _toRespawn] call f_fnc_doRespawnSquare;
};

// Pass position and object as arguments to the dialog
["Respawn at cursor", _onConfirm, _this] call f_fnc_selectFromDeadPlayers;