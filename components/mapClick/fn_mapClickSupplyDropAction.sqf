#include "macros.hpp"
// F3 - Mission Maker Supply Drop
// Credits: Created by Volc, from the F3 mapClickTeleport script, and the dropit script by Kronzky http://www.kronzky.info/
// ====================================================================================

CLIENT_ONLY;

// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// SET UP VARIABLES
// Make sure all global variables are initialized
if (isNil "f_var_mapClickSupplyDrop_Uses") then { f_var_mapClickSupplyDrop_Uses = 0 };
if (isNil "f_var_mapClickSupplyDrop_Units") then { f_var_mapClickSupplyDrop_Units = [] };
if (isNil "f_var_mapClickSupplyDrop_Height") then { f_var_mapClickSupplyDrop_Height = 1000 };

// Make sure that no non-existing units have been parsed
{
	if (isNil _x) then
    {
        f_var_mapClickSupplyDrop_Units set [_forEachIndex,objNull];
	}
    else
    {
		f_var_mapClickSupplyDrop_Units set [_forEachIndex, call compile format ["%1",_x]];
	};

} forEach f_var_mapClickSupplyDrop_Units;

// Reduce the array to valid units only
f_var_mapClickSupplyDrop_Units = f_var_mapClickSupplyDrop_Units - [objNull];

// ====================================================================================

// CHECK IF COMPONENT SHOULD BE ENABLED
// We end the script if it is not running on a server or if the player is not the leader of his/her group

if (count f_var_mapClickSupplyDrop_Units > 0 && !(player in f_var_mapClickSupplyDrop_Units)) exitWith {};
if (player != leader group player) exitWith {};

// ====================================================================================

f_var_mapClickSupplyDrop_textAction = "Supply Drop";
f_var_mapClickSupplyDrop_textDone = "Supplies have been dropped at the selected location.";
f_var_mapClickSupplyDrop_textSelect = "Click on the map to set Supply Drop coordinates.";

// ====================================================================================

// ADD SupplyDrop ACTION TO PLAYER ACTION MENU
// Whilst the player is alive we add the SupplyDrop action to the player's action menu.
// If the player dies we wait until he is alive again and re-add the action.

f_mapClickSupplyDropAction = player addaction [f_var_mapClickSupplyDrop_textAction, { [] spawn f_fnc_mapClickSupplyDropUnit }, "", 0, false, true, "", "_this == player"];
