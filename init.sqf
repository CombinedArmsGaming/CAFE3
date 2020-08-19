#include "macros.hpp"

// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

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
	DEBUG_PRINT_LOG("Using CLIENT config and startup groups.")

	#include "customStartup_client.sqf"

	#include "startup\configuration\groups\clientConfigGroup.sqf"

	#include "startup\components\groups\clientStartupGroup.sqf"

	missionNamespace setVariable ["f_var_initClient", true, true];

};

if (isServer) then
{
	DEBUG_PRINT_LOG("Using SERVER config and startup groups.")

	#include "customStartup_server.sqf"

	#include "startup\configuration\groups\serverConfigGroup.sqf"

	#include "startup\components\groups\serverStartupGroup.sqf"

	missionNamespace setVariable ["f_var_initServer", true, true];

};
