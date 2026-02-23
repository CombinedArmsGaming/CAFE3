#include "../macros.hpp"
#include "../../../squadmarker_macros.hpp"
/*
    Helper function for Emma's CAFE UIs. Populates the list of groups for selection.

    Arguments:
        0: Control - Display control of groups list to populate

    Return:
        Nothing
*/

params ["_groupsList"];

// Collect all important squads and all squads with players in them that it makes sense to let this player join
private _groupsToInclude = (groups playerSide) select {
	private _name = groupId _x;

	// Not spectators group
	(_name isNotEqualTo "Spectators") and
	// Not zeus group if the player is not a zeus
	((player getVariable ["f_var_isZeus", false]) or {(toLower _name) isNotEqualTo "zeus"}) and 
	// Must either be important or have players in
	(SQUAD_IS_IMPORTANT(_x) or ({((units _x) findIf { isPlayer _x }) >= 0}))
};

// Add the squads to the list
{
	private _name = groupId _x;
	private _count = count (units _x);
	private _idx = _groupsList lbAdd (format ["%1 (%2)", _name, _count]);
	_groupsList lbSetData [_idx, _name];
} forEach _groupsToInclude;

_groupsList lbSortBy ["TEXT", false, false];

// Default select the item in the list according to the players last group name
private _playerGroupName = missionNamespace getVariable ["f_var_lastPlayerGroupName", ""];
DEBUG_FORMAT1_LOG("[RESPAWN] lastPlayerGroupName was %1, attempting to select", _playerGroupname);
for "_i" from 0 to ((lbSize _groupsList) - 1) do {
    if ((_groupsList lbData _i) isEqualTo _playerGroupName) exitWith {
        _groupsList lbSetCurSel _i;
    }
};