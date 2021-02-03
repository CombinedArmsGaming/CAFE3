
// Downtime: opt-out of the spectator cam when you go unconscious.  Does not affect spectator upon death.
[
	"CA2_Downtime_OptOut",
	"CHECKBOX",
	[
		"Opt-out of unconscious spectator",
		"Opt-out of entering spectator mode when you go unconscious.  Instead, you will stay in the black screen until you wake up or die.\nDoes not affect entering spectator upon death."
	],
	[
		CATEGORY_NAME,
		"Downtime"
	],
	false,
	0,
	nil,
	false

] call CBA_fnc_addSetting;
