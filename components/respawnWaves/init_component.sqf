#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting respawnWaves")

[] spawn
{
	while {true} do
	{
		_canRespawn = player getVariable ["f_var_canUseRespawnMenu", false];
		if !(_canRespawn) then { _canRespawn = (rank player == 'COLONEL') };
		if !(_canRespawn) then { _canRespawn = (serverCommandAvailable '#kick') };

		player setVariable ["f_var_canUseRespawnMenu", _canRespawn];

		sleep 5;

	};


};


RUN_FUNC_ONCE_ASYNC(f_fnc_aceRespawnMenuAction)
