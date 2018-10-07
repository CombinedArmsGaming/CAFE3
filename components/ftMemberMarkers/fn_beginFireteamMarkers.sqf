// 	F3 - Fireteam Member Markers
// 	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//  Description: Launches the main part of the FireTeam Member markers.
//  Parameters
//		Nothing.
//	Returns:
//		Nothing.
// 	Example:
// 		[] call f_fnc_SetLocalFTMemberMarker;
//
// ====================================================================================

#include "macros.hpp"

// ====================================================================================

// Maintaining list of units to draw markers for.

#define FTMK_MKHASH f_hash_playerMarkers
HASH_CREATE(FTMK_MKHASH);

// Defining these in global namespace to keep visibility in HASH_FOREACH call.  No closures allowed.
#define FTMK_TOREMOVE_1 f_array_playerMarkerKeysToRemove_loop1
FTMK_TOREMOVE_1 = [];

#define FTMK_GROUP f_array_playerMarkerGroupMembers
FTMK_GROUP = [];


// Unit addition loop.
[] spawn
{
    _syncGroupLeavers =
    {
        if (!(_key in FTMK_GROUP)) then
        {
            FTMK_TOREMOVE_1 pushBack _key;
        };
    };


	while {!isNull player} do
	{
        // Group synchronization: need to add units which were not previously tracked by the system.
        FTMK_GROUP = units (group player);

        {
            _val = HASH_GET(FTMK_MKHASH, _x);

            if (isNil "_val") then
            {
                DEBUG_FORMAT1_LOG("Adding group member: %1",_x)
                HASH_SET(FTMK_MKHASH, _x, []);
            };

        } forEach FTMK_GROUP;


        // Group synchronization: need to remove units which have left the group.
        FTMK_TOREMOVE_1 = [];
        HASH_FOREACH(FTMK_MKHASH, _syncGroupLeavers);

        {
            DEBUG_FORMAT1_LOG("Removing group member: %1",_x)
            HASH_REMOVE(FTMK_MKHASH, _x);

        } forEach FTMK_TOREMOVE_1;

		uiSleep 5;

	};

};




// Defining this array in global namespace to keep visibility in HASH_FOREACH call.  No closures allowed.
#define FTMK_TOREMOVE_2 f_array_playerMarkerKeysToRemove_loop2
FTMK_TOREMOVE_2 = [];

// Unit maintenance loop.
[] spawn
{
    _syncMarker =
    {
        if (isNull _key or {!alive _key}) then
        {
            FTMK_TOREMOVE_2 pushBack _key;

            if (!(_value isEqualTo [])) then
            {
                DEBUG_FORMAT1_LOG("Deleting group marker for: %1",_key)
                deleteMarkerLocal (_value select 1);
                deleteMarkerLocal (_value select 0);
            };

        }
        else
        {
            if (_value isEqualTo []) then
            {
                _value = [_key] call f_fnc_createUnitMarker;
                HASH_SET(FTMK_MKHASH, _key, _value);
                DEBUG_FORMAT1_LOG("Created group member for: %1",_key)
            };

            [_key, _value] call f_fnc_updateUnitMarker;
        };

    };


    while {!isNull player} do
	{
        FTMK_TOREMOVE_2 = [];

        HASH_FOREACH(FTMK_MKHASH, _syncMarker);

        {
            DEBUG_FORMAT1_LOG("Removing group member: %1",_x)
            HASH_REMOVE(FTMK_MKHASH, _x);

        } forEach FTMK_TOREMOVE_2;

		uiSleep 1;
	};

};




// Broadcasting team colour to allow other players to update our marker colour on their machine.
// BUB TODO 2018-09-19 :: Extend this to local AI.
[] spawn
{

    while {!isNull player} do
	{
        _myTeam = assignedTeam player;
        _myTeamStored = player getVariable ["assignedTeam", ""];

        if (_myTeam != _myTeamStored) then
        {
            _color = [_myTeam] call f_fnc_getMarkerColor;

            player setvariable ["assignedTeam", _color, true];
        };

		sleep 5;
	};

};

DEBUG_PRINT_LOG("started all marker loops")
