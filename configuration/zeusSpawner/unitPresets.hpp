/*
	Zeus spawner AI presets

	Use this file to set up presets of groups of units to be spawned with the zeus spawner. 

	A "unit" here is a group or groups that can be spawned by one click of the spawn button.
	It is not necessarily only one soldier or group.

	Units and categories are defined as classes, with unit classes contained inside a category class.

	The class name is not seen in game and is restricted to letters, numbers, and underscores. 

	A category has:
		- categoryName: The name of the category which you will see in-game.
		- gear: 		The faction code as used in the CAFE framework. For example, "blu_f" means the gear will be taken from the BLUFOR gearscript.
		- side:			This defines the side that soldiers spawned will bear allegiance to. Available options are: "west" (BLUFOR), "east" (OPFOR), "resistance", and "civilian".
		- Any number of unit classes.
	
	A unit has (at most):
		- unitName: 		The name that will be shown in-game on the zeus spawner UI.
		- units[]:			An array of soldiers to be spawned, given as gearscript loadout codes.
		- vehicle: 			The classname of a vehicle to be spawned. You can get it by right-clicking a vehicle in 3DEN and selecting "Log > Log classes to clipboard".
		- reinforcements[]:	An array of soldiers to be spawned in the vehicle's cargo space, given as gearscript loadout codes.
		- groups[]:			An array of units that will be spawned as separate groups, explained in detail below.
	
	The only field that must be present in all unit definitions is unitName. You can include whichever of the rest you wish, with some limitations explained below. 

	If a vehicle is defined, then units[] *must* also be defined. The units[] will be treated as the crew of that vehicle and will spawn inside. The first entry of units[] will always be the commander.

	If reinforcements[] is defined, then a vehicle and units[] *must* also be defined. The reinforcements will spawn in the cargo space of the vehicle.
		The vehicle gets a TR unload waypoint and a RTB waypoint (only if it's unarmed), the group a Move waypoint. The vehicle will also despawn on RTB. If the vehicle is a Heli, it will spawn flying and always RTB

	The groups[] array allows you to spawn many separate groups with one click. 
	The groups[] array can contain as many groups as you wish, which will be spawned alongside units[], vehicle, and reinforcements[], if they are defined.
	You can define a group "in-line" as an array of gearscript loadout codes, similarly to the units[] array. You may not reference other units in groups defined this way.
	You can reference other defined units by their class name (NOT their unitName). Definition order does not matter, and names are not case sensitive.
	Other units are referenced as Category_Class.Unit_Class (e.g. BLUFOR_Infantry.Rifleman). This means you can reference across categories, even including other sides if you wish.
	If you are referencing a unit in the same category, you can leave off the Category_Class (e.g. just Rifleman).
	Note that you can not directly reference a vehicle class name. It must be defined in a separate unit to be referenced in groups[].
	If you reference another unit, it will be spawned just like if you had clicked the spawn button for that unit.
*/




// Start editing below here
// ---------------------------------------------------------------------------------------------------------------------------------------

class CA_ZeusUI_Units
{

	// Category definition
	class BLUFOR_Infantry
	{
		categoryName = "BLUFOR Infantry"; // This is the name of the category which you will see in-game.
		gear = "blu_f";                   // This is the faction code as used in the CAFE framework. Here, "blu_f", means the gear will be taken from the BLUFOR gearscript (aka BLUFOR).
		side = "west";                    // "west" means the units will bear allegiance to the western side (aka BLUFOR). Available options are: "west", "east", "resistance" and "civilian".

		// Units definition
		class Rifleman
		{
			unitName = "BLUFOR Rifleman"; // This is the name of the squad which will be shown in-game.
			units[] = {"rif"};            // This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "BLUFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "BLUFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "BLUFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "BLUFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "BLUFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "BLUFOR MK Team";
			units[] = {"rif", "mk"};
		};

		class MechanizedPlatoon
		{
			unitName = "BLUFOR Mechanized Platoon";
			vehicle = "B_APC_Wheeled_01_cannon_F"; 	// The vehicle, units, and reinforcements will be spawned alongside the groups[]
			units[] = {"crew", "crew", "crew"}; 	
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
			groups[] = {
				{"co", "med", "fac"}, 								// Groups can be defined "in-line" the same way units are. You cannot reference other units in this in-line definition
				"Fireteam_4x", 										// You can reference units defined in the same category by their class name, or by Category_Class.Unit_Class, e.g. BLUFOR_Infantry.Fireteam_4x
				"BLUFOR_Vehicles.IFV6C_Panther_Reinforcements",		// You can reference units in other categories by Category_Class.Unit_Class
				"BLUFOR_Vehicles.M2A4_Slammer_UP" 					// Note that this is a *unit* class name, not the vehicle's class name			
			};
		};
	};

	class BLUFOR_Vehicles
	{
		categoryName = "BLUFOR Vehicles";
		gear = "blu_f";
		side = "west";

		class Tank_Platoon
		{
			unitName = "M2A4 Platoon"
			groups[] = { 				// You can have a unit with only groups and no units or vehicle or reinforcements
				"M2A4_Slammer_UP",
				"M2A4_Slammer_UP",
				"M2A4_Slammer_UP"
			};
		};

		class M2A4_Slammer_UP
		{
			unitName = "M2A4 Slammer UP";       // This is the name of the vehicle which will be shown in-game.
			vehicle = "B_MBT_01_TUSK_F";        // This is the classname of the vehicle. You can get it by right-clicking a vehicle in 3DEN and selecting "Log > Log classes to clipboard"
			units[] = {"crew", "crew", "crew"}; // This is the crew of the vehicle.  The first unit in the list is always the commander.
		};

		class AMV7_Marshall // Classnames can't contain '-'
		{
			unitName = "AMV-7 Marshall";
			vehicle = "B_APC_Wheeled_01_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class AMV_7_Reinforcements
		{
			unitName = "AMV-7 Marshall + Squad 6x";
			vehicle = "B_APC_Wheeled_01_cannon_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // When defined, this group spawns in the cargo space of the vehicle. The vehicle gets a TR unload waypoint and a RTB waypoint (only if it's unarmed), the group a Move waypoint. The vehicle will also despawn on RTB. If the vehicle is a Heli, it will spawn flying and always RTB
		};

		class IFV6C_Panther
		{
			unitName = "IFV-6C Panther";
			vehicle = "B_APC_Tracked_01_rcws_F";
			units[] = {"crew", "crew", "crew"};
		};

		class IFV6C_Panther_Reinforcements
		{
			unitName = "IFV-6C Panther + Squad 6x";
			vehicle = "B_APC_Tracked_01_rcws_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class Hunter_HMG
		{
			unitName = "Hunter HMG";
			vehicle = "B_MRAP_01_HMG_F";
			units[] = {"ftl", "rif", "rif"};
		};

		class HEMTT_Reinforcements
		{
			unitName = "HEMTT Transport + Section 9x";
			vehicle = "B_Truck_01_covered_F";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};
	};




	class OPFOR_Infantry
	{
		categoryName = "OPFOR Infantry";
		gear = "opf_f";
		side = "east";

		// Units definition
		class Rifleman
		{
			unitName = "OPFOR Rifleman"; // This is the name of the squad which will be shown in-game.
			units[] = {"rif"};           // This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "OPFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "OPFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "OPFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "OPFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "OPFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "OPFOR MK Team";
			units[] = {"rif", "mk"};
		};

		class MechanizedPlatoon
		{
			unitName = "OPFOR Mechanized Platoon";
			vehicle = "O_APC_Wheeled_02_rcws_F"; 	// The vehicle, units, and reinforcements will be spawned alongside the groups[]
			units[] = {"crew", "crew", "crew"}; 	
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
			groups[] = {
				{"co", "med", "fac"}, 								// Groups can be defined "in-line" the same way units are. You cannot reference other units in this in-line definition
				"OPFOR_Infantry.Fireteam_4x", 						// You can reference units defined in the same category by their class name, or by Category_Class.Unit_Class, e.g. OPFOR_Infantry.Fireteam_4x
				"OPFOR_Vehicles.BTRK_Kamysh_Reinforcements",		// You can reference units in other categories by Category_Class.Unit_Class
				"OPFOR_Vehicles.T100_Varsuk" 					
			};
		};
	};

	class OPFOR_Vehicles
	{
		categoryName = "OPFOR Vehicles";
		gear = "opf_f";
		side = "east";

		class Tank_Platoon
		{
			unitName = "Varsuk Platoon"
			groups[] = { 				// You can have a unit with only groups and no units or vehicle or reinforcements
				"T100_Varsuk",
				"T100_Varsuk",
				"T100_Varsuk"
			};
		};

		class T100_Varsuk // Classnames can't contain '-'
		{
			unitName = "T-100 Varsuk";
			vehicle = "O_MBT_02_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class MSE3_Marid
		{
			unitName = "MSE-3 Marid";
			vehicle = "O_APC_Wheeled_02_rcws_F";
			units[] = {"crew", "crew", "crew"};
		};

		class MSE3_Marid_Reinforcements
		{
			unitName = "MSE-3 Marid + Squad 6x";
			vehicle = "O_APC_Wheeled_02_rcws_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class BTRK_Kamysh
		{
			unitName = "BTR-K Kamysh";
			vehicle = "O_APC_Tracked_02_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class BTRK_Kamysh_Reinforcements
		{
			unitName = "BTR-K Kamysh + Squad 6x";
			vehicle = "O_APC_Tracked_02_cannon_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class Ifrit_HMG
		{
			unitName = "Ifrit HMG";
			vehicle = "O_MRAP_02_HMG_F";
			units[] = {"ftl", "rif", "rif"};
		};

		class Tempest_Reinforcements
		{
			unitName = "Tempest Transport + Section 9x";
			vehicle = "O_Truck_03_covered_F";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};
	};




	class INDFOR_Infantry
	{
		categoryName = "INDFOR Infantry";
		gear = "ind_f";
		side = "resistance";

		// Units definition
		class Rifleman
		{
			unitName = "INDFOR Rifleman"; // This is the name of the squad which will be shown in-game.
			units[] = {"rif"};            // This is the squad which will spawn - this just spawns one rifleman.
		};

		class Fireteam_4x
		{
			unitName = "INDFOR Fireteam 4x";
			units[] = {"ftl", "ar", "lat", "rif"};
		};

		class Squad_6x
		{
			unitName = "INDFOR Squad 6x";
			units[] = {"ftl", "ar", "aar", "lat", "rif", "mk"}; // This spawns a full 6-man fireteam. You can have as many or as few units in a squad as you want.
		};

		class Section_9x
		{
			unitName = "INDFOR Section 9x";
			units[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};

		class LAT_Team
		{
			unitName = "INDFOR LAT Team";
			units[] = {"rif", "lat"};
		};

		class AR_Team
		{
			unitName = "INDFOR AR Team";
			units[] = {"aar", "ar"};
		};

		class MK_Team
		{
			unitName = "INDFOR MK Team";
			units[] = {"rif", "mk"};
		};

		class MechanizedPlatoon
		{
			unitName = "INDFOR Mechanized Platoon";
			vehicle = "I_APC_Wheeled_03_cannon_F"; 	// The vehicle, units, and reinforcements will be spawned alongside the groups[]
			units[] = {"crew", "crew", "crew"}; 	
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
			groups[] = {
				{"co", "med", "fac"}, 								// Groups can be defined "in-line" the same way units are. You cannot reference other units in this in-line definition
				"INDFOR_Infantry.Fireteam_4x", 						// You can reference units defined in the same category by their class name, or by Category_Class.Unit_Class, e.g. OPFOR_Infantry.Fireteam_4x
				"INDFOR_Vehicles.FV720_Mora_Reinforcements",		// You can reference units in other categories by Category_Class.Unit_Class
				"INDFOR_Vehicles.MBT52_Kuma" 					
			};
		};
	};

	class INDFOR_Vehicles
	{
		categoryName = "INDFOR Vehicles";
		gear = "ind_f";
		side = "resistance";

		class MBT52_Kuma // Classnames can't contain '-'
		{
			unitName = "MBT-52 Kuma";
			vehicle = "I_MBT_03_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class AFV4_Gorgon
		{
			unitName = "AFV-4 Gorgon";
			vehicle = "I_APC_Wheeled_03_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class AFV4_Gorgon_Reinforcements
		{
			unitName = "AFV-4 Gorgon + Squad 6x";
			vehicle = "I_APC_Wheeled_03_cannon_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class FV720_Mora
		{
			unitName = "FV-720 Mora";
			vehicle = "I_APC_tracked_03_cannon_F";
			units[] = {"crew", "crew", "crew"};
		};

		class FV720_Mora_Reinforcements
		{
			unitName = "FV-720 Mora + Squad 6x";
			vehicle = "I_APC_tracked_03_cannon_F";
			units[] = {"crew", "crew", "crew"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "rif", "mk"};
		};

		class Strider_HMG
		{
			unitName = "Strider HMG";
			vehicle = "I_MRAP_03_hmg_F";
			units[] = {"ftl", "rif", "rif"};
		};

		class Zamak_Reinforcements
		{
			unitName = "Zamak Transport + Section 9x";
			vehicle = "I_Truck_02_covered_F";
			units[] = {"rif", "rif"};
			reinforcements[] = {"ftl", "ar", "aar", "lat", "med", "mk", "rif", "rif", "rif"};
		};
	};




	//If you are in need of civilians being spawned, e.g. for story purposes, this is the category to define them in. 
	class Civilian_Units 
	{
		categoryName = "Civilian";
		gear = "civ_f";
		side = "civilian";

		// Units definition
		class IDAP_Medic
		{
			unitName = "IDAP Medic";  // This is the name of the unit which will be shown in-game.
			units[] = {"idap_medic"}; // Do not forget to actually define the gear in 'configuration\loadouts\gear_civilian.sqf' and the identity in 'configuration\identity\identity_assignment.sqf'.
		};
	};
};


