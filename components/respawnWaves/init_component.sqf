#include "macros.hpp"


if (isServer) then
{
	if (isNil 'ca_respawnmarker') then
	{
		DEBUG_PRINT_LOG("[RespawnWaves] ca_respawnmarker is nil, setting it to respawn_west by default.")
		missionNamespace setVariable ["ca_respawnmarker", "respawn_west", true];
	};

	if (getMarkerColor ca_respawnmarker == "") then
	{
		DEBUG_PRINT_LOG("[RespawnWaves] ca_respawnmarker doesn't exist, creating it at a random player position.")
		_playerPos = getPos (selectRandom (allPlayers - entities "HeadlessClient_F"));
		createMarker [ca_respawnmarker, _playerPos];
	};

	_pos = getMarkerPos ca_respawnmarker;
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
