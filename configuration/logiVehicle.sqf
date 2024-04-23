/*

    Logistics vehicle configuration
    Inspired by F3_CA's logi vic system.  Initial work by Joecuronium, expanded by Bubbus.

    This file allows you to configure logistics vehicles for your mission.
    Logistics vehicles can be used to spawn-in new assets for your players.  It may be operated by anyone in a certain group, or anyone of a certain role.

    Multiple kinds of logistics vehicle may be configured here.  In the editor, assign the logistics role to a vehicle by using the following line in the 'Init' box:

        [this, "example"] call f_fnc_setLogiVehicle;

*/

BEGIN_LOGI_CONFIG;


// Create a type of logi vehicle named "example".
CREATE_LOGI_TYPE(example);

// Add spawnable vehicles to the logi vic.
ADD_VEHICLE(example,"B_MRAP_01_F",2);
ADD_VEHICLE(example,"B_Quadbike_01_F",5);

// The same commands can be used to spawn spare wheels and tracks.
ADD_VEHICLE(example,"ACE_Track",6);
ADD_VEHICLE(example,"ACE_Wheel",6);

// This special command lets you give gearscript to a vehicle (for example, ammo crates).
ADD_VEHICLE_WITH_GEAR(example,"Box_NATO_Equip_F",5,"crate_small");
SET_CUSTOM_NAME("Small Ammo Crate"); // This command lets you give a custom name to the vehicle you've just added.

ADD_VEHICLE_WITH_GEAR(example,"B_supplyCrate_F",5,"crate_med");
SET_CUSTOM_NAME("Large Ammo Crate");


// Special "Init" code, see below for details.
private _tankCode = 
{
    // This code will execute locally to the person using the action.
    // This will be executed ~5s after the vehicle has been moved into the AO.
    params ["_spawnedVic", "_logiVic", "_logiType", "_faction", "_spawnedVicName"];

    // Enable hunter-killer by default.
    _spawnedVic setVariable ["ace_hunterkiller", true, true];

    // Add a toolkit and backpack only.
    _spawnedVic addItemCargoGlobal ["Toolkit", 1];
    _spawnedVic addBackpackCargoGlobal ["B_AssaultPack_rgr", 1];
};

// This special command lets you run some code on the vehicle you just spawned, kind of like the "Init" box in the editor.
ADD_VEHICLE_WITH_CODE(example,"B_MBT_01_cannon_F",2,_tankCode);


// Set the faction of the logi vehicle.  Used to choose the correct gear for gearscripted crates etc.
SET_FACTION(example,"blu_f");

// Allow only the command group and Zeus group to use this vehicle.
// If you don't add any groups then the vehicle can be used by every group.
ADD_GROUP(example,"Command");
ADD_GROUP(example,"Zeus");

// Allow only people with "logi", "eng" or "zeus" gearscript to use this vehicle.
// If you don't add any roles then the vehicle can be used by every role.
ADD_ROLE(example,"logi");
ADD_ROLE(example,"eng");
ADD_ROLE(example,"zeus");
