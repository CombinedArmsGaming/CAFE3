#define FACTION blufor

/*

    Squad marker configuration file - BLUFOR side.

    Available commands:

    MAKE_SQUAD_EDITABLE(SQUAD_NAME)
    -   Makes a squad marker editable.  This command must be called before configuring a squad's marker.

    SET_SQUAD_VISIBILITY(SQUAD_NAME,<true or false>)
    -   If true, forces the squad marker to be visible.  If false, hides the squad's marker.

    HIDE_SQUAD(SQUAD_NAME)
    -   Hides the squad's marker, useful for zeus units, shot-down pilots, traitors...

    UNHIDE_SQUAD(SQUAD_NAME)
    -   Forces the squad's marker to be visible.  This is the default behaviour anyway.

    SET_SQUAD_ICON(SQUAD_NAME,ICON)
    -   Forces the squad's icon.  If this is not used, the marker will automatically change to show the squad's assets.
    Choices for ICON are:
        HELO, ANTIAIR, ARMOR, ARTILLERY, HQ, INFANTRY, REPAIR, MECHINF, MEDIC, MORTAR, MOTORINF, NAVAL, PLANE, RECON, SUPPLY, UNKNOWN

    SET_SQUAD_COLOUR(NAME,COLOUR)
    -   Sets the squad marker's colour.  The default colour is white.
    Choices for COLOUR are:
        RED, ORANGE, YELLOW, GREEN, BLUE, CYAN, MAGENTA, PINK, PURPLE, WHITE, LIGHTGREY, DARKGREY, BLACK, GREY, BROWN, KHAKI

    SET_SQUAD_NAME(NAME,"override")
    -   Overrides the squad's name on the marker.  The default name is the squad's real name.

*/


// Zeus squad
MAKE_SQUAD_EDITABLE(ZEUS);
HIDE_SQUAD(ZEUS);

MAKE_SQUAD_EDITABLE(ALPHA);
SET_SQUAD_COLOUR(ALPHA,RED);
SET_SQUAD_NAME(ALPHA,"Alpha");

MAKE_SQUAD_EDITABLE(BRAVO);
SET_SQUAD_COLOUR(BRAVO,BLUE);
SET_SQUAD_NAME(BRAVO,"Bravo");

MAKE_SQUAD_EDITABLE(CHARLIE);
SET_SQUAD_COLOUR(CHARLIE,GREEN);
SET_SQUAD_NAME(BRAVO,"Charlie");

MAKE_SQUAD_EDITABLE(COMMAND);
SET_SQUAD_COLOUR(COMMAND,YELLOW);
SET_SQUAD_NAME(COMMAND,"Command");
