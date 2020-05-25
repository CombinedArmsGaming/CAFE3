#define FACTION blufor

/*

    Squad marker configuration file - BLUFOR side.

    Available commands:

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

*/


// Zeus squad
SET_SQUAD_IMPORTANT(ZEUS,true);
HIDE_SQUAD(ZEUS);

SET_SQUAD_IMPORTANT(ALPHA,true);
SET_SQUAD_COLOUR(ALPHA,RED);

SET_SQUAD_IMPORTANT(BRAVO,true);
SET_SQUAD_COLOUR(BRAVO,BLUE);

SET_SQUAD_IMPORTANT(CHARLIE,true);
SET_SQUAD_COLOUR(CHARLIE,GREEN);

SET_SQUAD_IMPORTANT(COMMAND,true);
SET_SQUAD_COLOUR(COMMAND,YELLOW);
