#include "macros.hpp"

// F3 - Safe Start, Safety Toggle
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//=====================================================================================


CLIENT_ONLY;

// Delete bullets from fired weapons
if (isNil "f_eh_safetyMan") then
{
	f_eh_safetyMan = player addEventHandler ["Fired",
	{
		deletevehicle (_this select 6);
		player sideChat "Safestart is currently active - your gun will not work.";
	}];
};

// Disable guns and damage for vehicles if player is crewing a vehicle
if (vehicle player != player && {player in [gunner vehicle player ,driver vehicle player ,commander vehicle player]}) then
{
	player setVariable ["f_var_safetyVeh", vehicle player];

	(player getVariable "f_var_safetyVeh") allowDamage false;

	if (isNil "f_eh_safetyVeh") then
	{
		f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler ["Fired",
		{
			deletevehicle (_this select 6);
			player sideChat "Safestart is currently active - your gun will not work.";
		}];

	};

};

// Make player invincible
player allowDamage false;
