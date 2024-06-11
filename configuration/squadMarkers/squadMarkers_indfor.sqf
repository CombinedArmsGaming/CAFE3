
#define FACTION indfor

/*

    Squad marker configuration file - INDFOR side.

    Available commands:

    SET_SQUAD_VISIBILITY(SQUAD_NAME,<true or false>);
    -   If true, forces the squad marker to be visible.  If false, hides the squad's marker.

    HIDE_SQUAD(SQUAD_NAME);
    -   Hides the squad's marker, useful for zeus units, shot-down pilots, traitors...

    UNHIDE_SQUAD(SQUAD_NAME);
    -   Forces the squad's marker to be visible.  This is the default behaviour anyway.

    SET_SQUAD_ICON(SQUAD_NAME,ICON);
    -   Forces the squad's icon.  If this is not used, the marker will automatically change to show the squad's assets.
    Choices for ICON are:
        ICON_HELO, ICON_ANTIAIR, ICON_ARMOR, ICON_ARTILLERY, ICON_HQ, ICON_INFANTRY, ICON_REPAIR, ICON_MECHINF,
        ICON_MEDIC, ICON_MORTAR, ICON_MOTORINF, ICON_NAVAL, ICON_PLANE, ICON_RECON, ICON_SUPPLY, ICON_UNKNOWN,
        ICON_ANTITANK, ICON_HEAVYANTITANK, ICON_HEAVYWEAPONS, ICON_EOD, ICON_SPECIALFORCES

    SET_SQUAD_COLOUR(NAME,COLOUR);
    -   Sets the squad marker's colour.  The default colour is white.
    Choices for COLOUR are:
        COLOUR_RED, COLOUR_ORANGE, COLOUR_YELLOW, COLOUR_GREEN, COLOUR_BLUE, COLOUR_CYAN, COLOUR_MAGENTA, COLOUR_PINK,
        COLOUR_PURPLE, COLOUR_WHITE, COLOUR_LIGHTGREY, COLOUR_DARKGREY, COLOUR_BLACK, COLOUR_GREY, COLOUR_BROWN, COLOUR_KHAKI

	-------------------------------------------------

	INFO: If identical squad names are used between sides, you will need to manipulate them differently.  This will be fixed in future.  For now, see below:

	_group = GET_SQUAD_ON_SIDE(NAME,SIDE);
	-	Finds a group with the given name on the given side.  Once this is done, you may use '_group' alongside any of the "DIRECT" versions of the commands above.

	Example:

	_group = GET_SQUAD_ON_SIDE(ZEUS,west);
	SET_SQUAD_IMPORTANT_DIRECT(_group,true);
	HIDE_SQUAD_DIRECT(_group);

*/

SET_SQUAD_IMPORTANT(INDIA-1,true);
SET_SQUAD_COLOUR(INDIA-1,COLOUR_RED);

SET_SQUAD_IMPORTANT(INDIA-2,true);
SET_SQUAD_COLOUR(INDIA-2,COLOUR_BLUE);

SET_SQUAD_IMPORTANT(INDIA-3,true);
SET_SQUAD_COLOUR(INDIA-3,COLOUR_GREEN);

SET_SQUAD_IMPORTANT(INDIA,true);
SET_SQUAD_COLOUR(INDIA,COLOUR_YELLOW);