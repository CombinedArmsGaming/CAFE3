#include "macros.hpp"

// ====================================================================================

// CAFE - Disable Saving and Auto Saving
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)

enableSaving [false, false];

// ====================================================================================

// CAFE - Mute Orders and Reports
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)

enableSentences false;

// ====================================================================================



// Thanks to http://killzonekid.com/arma-scripting-tutorials-mission-root/
MISSION_ROOT = call
{
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};



DEBUG_FORMAT2_LOG("Is CLIENT? %1.  Is SERVER? %2.",hasInterface,isServer)

if (IS_CLIENT) then
{
	DEBUG_PRINT_LOG("Using CLIENT groups.")

    #include "startup\components\globals\clientGlobals.sqf"

	#include "customStartup_client.sqf"

	#include "startup\configuration\groups\clientConfigGroup.sqf"

    missionNamespace setVariable ["f_var_frameworkSettingsReady_client", true];

	#include "startup\components\groups\clientStartupGroup.sqf"

	missionNamespace setVariable ["f_var_initClient", true];

};

if (isServer) then
{
	DEBUG_PRINT_LOG("Using SERVER groups.")

    #include "startup\components\globals\serverGlobals.sqf"

	#include "customStartup_server.sqf"

	#include "startup\configuration\groups\serverConfigGroup.sqf"

    missionNamespace setVariable ["f_var_frameworkSettingsReady_server", true, true];

	#include "startup\components\groups\serverStartupGroup.sqf"

	missionNamespace setVariable ["f_var_initServer", true, true];

};
