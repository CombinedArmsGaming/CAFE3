/*

	Map marker configuration

	All settings below can be changed while the mission is running (except for MicroDAGR integration).

	These settings are individually changeable for each player.  This is useful if some players should have markers and some should not.
	To change these settings for everyone, make sure that the change is 'global'.  Some examples are below:

	Example: disable squad markers for everyone (can be run mid-mission):
		missionNamespace setVariable ["f_var_showSquadMarkers", false, true];

	Example: disable squad markers for only the OPFOR side (can put this into the 'customStartup_server.sqf' file):
		[missionNamespace, ["f_var_showSquadMarkers", false]] remoteExecCall ["setVariable", east, "ChangeOpforMarkers"];

*/

// To disable squad markers on the map, set the variable on the line below to false
// Note: This variable can be changed while the mission is running
f_var_showSquadMarkers = true;

// To disable fireteam member markers on the map, set the variable on the line below to false
// Note: This variable can be changed while the mission is running
f_var_showFTMarkers = true;

// To hide AI squads on the map, set the variable on the line below to false
// Note: This variable can be changed while the mission is running
f_var_showNPCSquads = true;

// To disable squadmarker MicroDAGR integration, set the below variable to false.
// Note: MicroDAGR markers act like a normal GPS - they respect the configuration of the three settings above.
// Note: This variable cannot be changed while the mission is running
f_var_enableMicroDAGRSquadMarkers = true;
