#include "macros.hpp"

/*
	Eden kill-log renderer: Delete all kill-logs for this mission.

	USAGE:
	* Open the mission in the mission editor (aka 'Eden').

	* Use the 'Play' dropdown menu to load up the mission once (easiest way to do this is to choose multiplayer, go to the slotting screen and then come back).

	* Open up the debug console in the editor via the 'Tools' dropdown menu.

	* Type this into the code box at the top:
		[] call f_fnc_edenDeleteKillLogs;

	* Click the 'Local exec' button.  If successful, a message will appear below the code box stating so.

	TROUBLESHOOTING:
	* It doesn't work!
		Pay attention to step 2 of the USAGE section.  This needs to be done so that the framework's code is loaded into the editor.

*/

profileNamespace setVariable [FULL_KILL_LOG_KEY_CLIENT, nil];

[] call f_fnc_edenClearKillLogDisplay;


#define returnval 'Deleted all kill logs for ##KILL_LOG_NAME##.'
returnval
