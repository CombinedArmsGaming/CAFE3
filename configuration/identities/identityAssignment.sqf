/*

    Assign custom identities to factions with the following syntax:

    SET_FACTION_IDENTITY(FACTION_NAME,IDENTITY_NAME);

    For example:
    SET_FACTION_IDENTITY(opfor,british);

*/


BEGIN_IDENTITY_ASSIGNMENT;

SET_FACTION_IDENTITY(opfor,iranian);
SET_FACTION_IDENTITY(blufor,american);
SET_FACTION_IDENTITY(indfor,greek);
SET_FACTION_IDENTITY(guerrilla,greek);
SET_FACTION_IDENTITY(civilian,greek);
