// ACRE integration for CAFE, by Bubbus
// Add an event handler to react to gear assignment - configure radios freshly given to a unit.

[
	"CA_PostGearscriptUnit_Local", 
	f_fnc_configureUnitRadios

] call CBA_fnc_addEventHandler;