/* 
	Author:	Joecuronium
	Description:
		This file allows you to enable different addon settings. Be sure to only enable one per category.
		This system is only for the sake of convenience and does not replace checking the ingame addon settings, which the framework relies on.
		If all settings of a category are disabled, you can set those settings manually in the ingame addon menu.
*/


/*
	MEDICAL SETTINGS
	Be sure to only uncomment one line in this category.
*/

// CA Medical settings (Reopening ON, 80% slower reopening).
// To enable this, uncomment the line below.
#define CA_MEDICAL_ADVANCED_80 1

// CA Medical settings (Reopening ON, 95% slower reopening).
// To enable this, uncomment the line below.
// #define CA_MEDICAL_ADVANCED_95 1

// CA Medical settings (Reopening OFF).
// To enable this, uncomment the line below.
// #define CA_MEDICAL_BASIC 1


/*
	DOWNTIME SPECTATE SETTINGS
	Be sure to only uncomment one line in this category.
*/

// CA2 downtime spectate cam modes. If this setting is enabled, unconscious players are restricted to 1PP and 3PP, dead players have all spectate modes.
// To disable this, comment-out or delete the line below INSTEAD of setting it to 0.
#define CA2_SPECTATE_LIMITED 1

// CA2 downtime spectate cam modes. If this setting is enabled, all spectate modes will be available to unconscious and dead players.
// To disable this, comment-out or delete the line below INSTEAD of setting it to 0. Be sure to only uncomment one line per category.
// #define CA2_SPECTATE_FULL 1


/*
	LOGISTICS SETTINGS
*/
// CA2 ideal logistics settings (this will set-up logistics for best use with the CA2 built-in logi-suite).
// To disable this, comment-out or delete the line below INSTEAD of setting it to 0.
#define CA2_LOGISTICS 1


/*
	ACRE SETTINGS
*/

// ACRE terrain loss.
// To enable terrain-loss, comment-out or delete the line below INSTEAD of setting it to 0.
#define DISABLE_ACRE_TERRAIN_LOSS 1

