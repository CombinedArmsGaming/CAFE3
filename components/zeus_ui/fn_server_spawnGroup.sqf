/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Spawns a group with the given parameters, using f_fnc_spawngroup or f_fnc_spawnvehiclegroup.
		All spawned units and vehicles will be added as editable objects to all curators.
		This functions is designed to be executed on the server (e.g. via remoteExec).
	Arguments:
		0:      <ARRAY>		Array of F3-compatible roles for the units to be spawned
		1:	<ARRAY>		Spawn position of the units
		2:	<STRING>	Faction of the group, as used in F3
		3:	<SIDE>		Side of the group to be spawned (west, east, resistance, civilian)
		4:	<STRING>	(optional) Class of the vehicle to spawn
		5:	<BOOL>		(optional) Whether or not to enable VCOM AI
		6:	<ARRAY>		(optional) Array with Guerrilla AI relevant settings; set to false to ignore
		7:	<ARRAY>		(optional) Array with Suppressive AI relevant settings; set to false to ignore
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"
#include "macros.hpp"

// Fetch our params
params ["_roles", "_pos", "_gear", "_side", ["_vehicleClass", ""], ["_enableVCOM", false], ["_guerrillaAI", false], ["_suppressiveAI", false]];


private _group = grpNull;
private _vehicle = objNull;

if (_vehicleClass != "") then
{
	_args = [_roles, _pos, _vehicleClass, _gear, _side, _suppressiveAI, _guerrillaAI, f_fnc_addToCurator];

	if ((_suppressiveAI isEqualType []) or (_guerrillaAI isEqualType [])) then
	{
		// Cre8or AI scripts are not HC compatible.
		TRANSFER_TO_SERVER(f_fnc_spawnVehicleGroup,_args);
	}
	else
	{
		TRANSFER_TO_HC(f_fnc_spawnVehicleGroup,_args);
	};

}
else
{
	_args = [_roles, _pos, _gear, _side, _suppressiveAI, _guerrillaAI, f_fnc_addToCurator];

	if ((_suppressiveAI isEqualType []) or (_guerrillaAI isEqualType [])) then
	{
		// Cre8or AI scripts are not HC compatible.
		TRANSFER_TO_SERVER(f_fnc_spawnGroup,_args);
	}
	else
	{
		TRANSFER_TO_HC(f_fnc_spawnGroup,_args);
	};

};
