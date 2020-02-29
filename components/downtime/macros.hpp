#include "../../macros.hpp"

#define GET_ACTIVITY(FUNC) (missionNamespace getVariable FUNC)

#define ACTIVITY_SPECTATE "f_fnc_downtimeSpectate"
#define ACTIVITY_REMOTECONTROL "f_fnc_downtimeControl"
#define ACTIVITY_NOTHING "f_fnc_downtimeDoNothing"
#define ACTIVITY_SELECTOR "f_fnc_downtimeActivitySelector"

#define RESPAWN_ALWAYS "respawnAlways"
#define RESPAWN_CONSENTFIRST "respawnWithConsent"

#define DOWNTIME_WAIT_TIME 10
#define DOWNTIME_CONTROL_SIDES [independent, east]

#define PLAYER_IS_DOWN (player getVariable ["ACE_isUnconscious", false] or {!alive player} or {missionNamespace getVariable ["f_var_playerHasBeenKilled", false]})
#define PLAYER_IS_GHOST ((missionNamespace getVariable ["f_var_playerHasBeenKilled", false]) and {alive player})
