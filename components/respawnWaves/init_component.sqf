#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"


if (isServer) then
{
	{
		_markerName = (format ["respawn_%1", toLower str _x]);

		if ((getMarkerColor _markerName) isEqualTo "") then
		{
			DEBUG_FORMAT1_LOG("[RespawnWaves] The respawn marker '%1' does not exist, creating it automatically at origin.",_markerName)
			createMarker [_markerName, [0,0,0]];
		};

    } forEach [west, east, independent, civilian];


	// Hey guess what?  If you mark a group as "do not delete" and then all the units leave the group, it gets deleted anyway.  cool.
	[] spawn
	{
		waitUntil
		{
			{
				_groupVar = format ["f_group_spectators_%1", toLower str _x];

		        if (isNull (missionNamespace getVariable [_groupVar, grpNull])) then
		        {
					DEBUG_FORMAT1_LOG("[RespawnWaves] Creating spectator group '%1'.",_groupVar)
		            _group = createGroup [_x, false];
					_group setGroupIdGlobal [format ["Spectators", _x]];
					_group deleteGroupWhenEmpty false;
					HIDE_SQUAD_DIRECT(_group);

		            missionNamespace setVariable [_groupVar, _group, true];
		        };

			} forEach [west, east, independent, civilian];

			false

		};

	};

};

if (hasInterface) then
{
	DEBUG_PRINT_LOG("initting respawnWaves")

	[] spawn
	{
		waitUntil
		{
			_canRespawn = ((leader group player) isEqualTo player);

			if !(_canRespawn) then
			{
				_canRespawn = (serverCommandAvailable '#kick')
			};

			player setVariable ["f_var_canUseRespawnMenu", _canRespawn];

			sleep 5;

			false

		};

	};

};
