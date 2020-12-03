/* Assign custom identities to factions with the following syntax:
 *
 * SET_FACTION_IDENTITY(FACTION_NAME,IDENTITY_NAME);
 *
 * For example: 
 * SET_FACTION_IDENTITY(opfor,brit);
 */


BEGIN_IDENTITY_ASSIGNMENT;

SET_FACTION_IDENTITY(opfor,brit);
SET_FACTION_IDENTITY(blufor,yank);
SET_FACTION_IDENTITY(indfor,greek);
SET_FACTION_IDENTITY(guerrilla,monke);
SET_FACTION_IDENTITY(civilian,coward);