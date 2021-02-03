
// Downtime: opt-out of the spectator cam when you go unconscious.  Does not affect spectator upon death.
[
	"CA2_Downtime_OptOut",
	"CHECKBOX",
	[
		"Opt-out of unconscious spectator",
		"Opt-out of entering spectator mode when you go unconscious.\nInstead, you will stay in the black screen until you wake up or die.\n\nDoes not affect entering spectator upon death."
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	false,
	2,
	nil,
	false

] call CBA_fnc_addSetting;


// Downtime: customise the time it takes to enter spectator after going unconscious.
[
	"CA2_Downtime_SpectatorWaitTime",
	"SLIDER",
	[
		"Seconds until unconscious spectator",
		"Customise the waiting time between you going unconscious and the spectator mode activating (in seconds).\nAllows you to spend longer in the black screen before switching.\n\nDoes not affect entering spectator upon death."
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	[16, 180, 16, 0, false],
	2,
	nil,
	false

] call CBA_fnc_addSetting;
