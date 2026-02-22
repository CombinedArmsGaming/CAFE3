/*

    Logistics vehicle configuration
    Inspired by F3_CA's logi vic system.  Initial work by Joecuronium, expanded by Bubbus.

    This file allows you to configure logistics vehicles for your mission.
    Logistics vehicles can be used to spawn-in new assets for your players.  It may be operated by anyone in a certain group, or anyone of a certain role.

    Multiple kinds of logistics vehicle may be configured here.  In the editor, assign the logistics role to a vehicle by using the following line in the 'Init' box:

        [this, "example_blu"] call f_fnc_setLogiVehicle;

*/

BEGIN_LOGI_CONFIG;


// Create a type of logi vehicle named "example_blu".
CREATE_LOGI_TYPE(example_blu);

// Add spawnable vehicles to the logi vic.
ADD_VEHICLE(example_blu,"B_MRAP_01_F",2);
ADD_VEHICLE(example_blu,"B_Quadbike_01_F",5);

// The same commands can be used to spawn spare wheels and tracks.
ADD_VEHICLE(example_blu,"ACE_Track",6);
ADD_VEHICLE(example_blu,"ACE_Wheel",6);

// This special command lets you give gearscript to a vehicle (for example_blu, ammo crates).
ADD_VEHICLE_WITH_GEAR(example_blu,"Box_NATO_Equip_F",5,"crate_small");
SET_CUSTOM_NAME("Small Ammo Crate"); // This command lets you give a custom name to the vehicle you've just added.

ADD_VEHICLE_WITH_GEAR(example_blu,"B_supplyCrate_F",5,"crate_med");
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
SET_FACTION(example_blu,"blu_f");

// Allow only the command group and Zeus group to use this vehicle.
// If you don't add any groups then the vehicle can be used by every group.
ADD_GROUP(example_blu,"COMMAND");
ADD_GROUP(example_blu,"ZEUS");

// Allow only people with "logi", "eng" or "zeus" gearscript to use this vehicle.
// If you don't add any roles then the vehicle can be used by every role.
ADD_ROLE(example_blu,"logi");
ADD_ROLE(example_blu,"eng");
ADD_ROLE(example_blu,"zeus");


// Create a type of logi vehicle named "example_ind".
CREATE_LOGI_TYPE(example_ind);

ADD_VEHICLE(example_ind,"I_MRAP_03_F",2);
ADD_VEHICLE(example_ind,"I_Quadbike_01_F",5);

ADD_VEHICLE(example_ind,"ACE_Track",6);
ADD_VEHICLE(example_ind,"ACE_Wheel",6);

ADD_VEHICLE_WITH_GEAR(example_ind,"Box_AAF_Equip_F",5,"crate_small");
SET_CUSTOM_NAME("Small Ammo Crate");

ADD_VEHICLE_WITH_GEAR(example_ind,"I_supplyCrate_F",5,"crate_med");
SET_CUSTOM_NAME("Large Ammo Crate");

SET_FACTION(example_ind,"ind_f");

ADD_GROUP(example_ind,"INDIA");
ADD_GROUP(example_ind,"Zeus");

ADD_ROLE(example_ind,"logi");
ADD_ROLE(example_ind,"eng");
ADD_ROLE(example_ind,"zeus");


// Create a type of logi vehicle named "example_opf".
CREATE_LOGI_TYPE(example_opf);

ADD_VEHICLE(example_opf,"O_MRAP_02_F",2);
ADD_VEHICLE(example_opf,"O_Quadbike_01_F",5);

ADD_VEHICLE(example_opf,"ACE_Track",6);
ADD_VEHICLE(example_opf,"ACE_Wheel",6);

ADD_VEHICLE_WITH_GEAR(example_opf,"Box_CSAT_Equip_F",5,"crate_small");
SET_CUSTOM_NAME("Small Ammo Crate");

ADD_VEHICLE_WITH_GEAR(example_opf,"O_supplyCrate_F",5,"crate_med");
SET_CUSTOM_NAME("Large Ammo Crate");

SET_FACTION(example_opf,"opf_f");

ADD_GROUP(example_opf,"TANGO");
ADD_GROUP(example_opf,"Zeus");

ADD_ROLE(example_opf,"logi");
ADD_ROLE(example_opf,"eng");
ADD_ROLE(example_opf,"zeus");