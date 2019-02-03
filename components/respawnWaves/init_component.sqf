#include "macros.hpp"


if (isServer) then
{
	if (isNil 'f_var_respawnMarker') then
	{
		DEBUG_PRINT_LOG("[RespawnWaves] f_var_respawnMarker is nil, setting it to respawn_west by default.")
		missionNamespace setVariable ["f_var_respawnMarker", "respawn_west", true];
	};

	if (getMarkerColor f_var_respawnMarker == "") then
	{
		DEBUG_PRINT_LOG("[RespawnWaves] f_var_respawnMarker doesn't exist, creating it at a random player position.")
		_playerPos = getPos (selectRandom (allPlayers - entities "HeadlessClient_F"));
		createMarker [f_var_respawnMarker, _playerPos];
	};

	_pos = getMarkerPos f_var_respawnMarker;
	_respawnObject = createSimpleObject ["Static", _pos];
	missionNamespace setVariable ["f_respawnWavesLocation", _respawnObject, true];

};

if (hasInterface) then
{
	DEBUG_PRINT_LOG("initting respawnWaves")

	[] spawn
	{
		while {true} do
		{
			_canRespawn = player getVariable ["f_var_canUseRespawnMenu", false];
			if !(_canRespawn) then { _canRespawn = (rank player == 'COLONEL') };
			if !(_canRespawn) then { _canRespawn = (serverCommandAvailable '#kick') };

			player setVariable ["f_var_canUseRespawnMenu", _canRespawn];

			if !(player getVariable ["f_var_hasRespawnMenuAction", false]) then
			{
				[] call f_fnc_aceRespawnMenuAction;
			};

			sleep 5;

		};

	};

};
