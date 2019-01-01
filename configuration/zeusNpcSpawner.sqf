#include "macros.hpp"

//	Zeus extensions for CA, by Bubbus.
//
//	This is the configuration file for the gearscript spawner.
//	The default example in this file covers all factions of vanilla Arma.  You can modify it to spawn your own custom units.
//	The NATO example has comments to help understanding.

CLIENT_WARN("[ZeusAdditions] Spawner config file running non-clientside!");


_units =
[
	[
		"NATO Infantry",		// This is the name of the category which you will see in-game.
		"inf", 					// "inf" marks this as an infantry category.
		"blu_f", 				// "blu_f" means that gear will be taken from the BLUFOR gearscript (aka NATO).
		west,					// west means the units will bear allegiance to the western side (aka NATO).
		[
			[
				"NATO Rifleman",	// This is the name of the squad which will be shown in-game.
				["rif"]				// This is the squad which will spawn - this just spawns one rifleman.
			],
			// If you get errors, make sure there's a comma at the end of all the sections except the very last one.  Look one line up.

			[
				"NATO Fireteam 6x",
				["ftl", "ar", "aar", "lat", "med", "mk"] // This spawns a full 6-man fireteam.  You can have as many or as few units in a squad as you want.
			],

			[
				"NATO Rifle Sec 9x",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			]
			// If you get errors, make sure there's a comma at the end of all the sections except the very last one.  Look one line up.
		]

	],
	// The comma rule applies here too.

	[
		"NATO Vehicles",
		"veh", 				// "veh" marks this as a vehicle category.
		"blu_f",
		west,
		[
			[
				"M2A4 Slammer UP",		// This is the name of the vehicle which will appear on-screen.
				"B_MBT_01_TUSK_F",		// This is the 'code-name' of the vehicle, which is important to get right.  You can see this when you mouse-over a vehicle in the EDEN editor.
				["crew","crew","crew"]		// This is the crew of the vehicle.  The first unit in the list is always the commander.
			],

			[
				"AMV-7 Marshall",
				"B_APC_Wheeled_01_cannon_F",
				["crew","crew","crew"]
			],

			[
				"IFV-6c Panther",
				"B_APC_Tracked_01_rcws_F",
				["crew","crew","crew"]
			],

			[
				"Hunter HMG",
				"B_MRAP_01_HMG_F",
				["ftl", "ar", "rif", "lat"]
			],

			[
				"HEMTT Transport",
				"B_Truck_01_transport_F",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			],

			[
				"UH-80 Ghost Hawk",
				"B_Heli_Transport_01_F",
				["crew","crew","crew","crew"]
			],

			[
				"CH-67 Huron",
				"B_Heli_Transport_03_F",
				["crew","crew","crew","crew"]
			],

			[
				"AH-99 Blackfoot",
				"B_Heli_Attack_01_F",
				["crew","crew"]
			]

		]

	],

	[
		"CSAT Infantry",
		"inf", "opf_f", east,
		[
			[
				"CSAT Rifleman",	// This is the name of the squad which will be shown in-game.
				["rif"]				// This is the squad which will spawn - this just spawns one rifleman.
			],
			// If you get errors, make sure there's a comma at the end of all the sections except the very last one.  Look one line up.

			[
				"CSAT Fireteam 6x",
				["ftl", "ar", "aar", "lat", "med", "mk"] // This spawns a full 6-man fireteam.  You can have as many or as few units in a squad as you want.
			],

			[
				"CSAT Rifle Sec 9x",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			]

		]

	],

	[
		"CSAT Vehicles",
		"veh", "opf_f", east,
		[
			[
				"T-100 Varsuk",
				"O_MBT_02_cannon_F",
				["crew","crew","crew"]
			],

			[
				"MSE-3 Marid",
				"O_APC_Wheeled_02_rcws_F",
				["crew","crew","crew"]
			],

			[
				"BTR-K Kamysh",
				"O_APC_Tracked_02_cannon_F",
				["crew","crew","crew"]
			],

			[
				"Ifrit HMG",
				"O_MRAP_02_HMG_F",
				["ftl", "ar", "rif", "lat"]
			],

			[
				"Zamak Transport",
				"O_Truck_02_transport_F",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			],

			[
				"PO-30 Orca",
				"O_Heli_Light_02_unarmed_F",
				["crew","crew"]
			],

			[
				"Mi-290 Taru",
				"O_Heli_Transport_04_covered_F",
				["crew","crew","crew"]
			],

			[
				"Mi-48 Kajman",
				"O_Heli_Attack_02_black_F",
				["crew","crew"]
			]

		]

	],

	[
		"AAF Infantry",
		"inf", "ind_f", independent,
		[
			[
				"AAF Rifleman",	// This is the name of the squad which will be shown in-game.
				["rif"]				// This is the squad which will spawn - this just spawns one rifleman.
			],
			// If you get errors, make sure there's a comma at the end of all the sections except the very last one.  Look one line up.

			[
				"AAF Fireteam 6x",
				["ftl", "ar", "aar", "lat", "med", "mk"] // This spawns a full 6-man fireteam.  You can have as many or as few units in a squad as you want.
			],

			[
				"AAF Rifle Sec 9x",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			]

		]

	],

	[
		"AAF Vehicles",
		"veh", "ind_f", independent,
		[
			[
				"MBT-52 Kuma",
				"I_MBT_03_cannon_F",
				["crew","crew","crew"]
			],

			[
				"AFV-4 Gorgon",
				"I_APC_Wheeled_03_cannon_F",
				["crew","crew","crew"]
			],

			[
				"FV-720 Mora",
				"I_APC_Tracked_03_cannon_F",
				["crew","crew","crew"]
			],

			[
				"Strider HMG",
				"I_MRAP_03_HMG_F",
				["ftl", "ar", "rif", "lat"]
			],

			[
				"Zamak Transport",
				"I_Truck_02_transport_F",
				["ftl", "ar", "aar", "lat", "med", "rif", "rif", "rif", "rif"]
			],

			[
				"WY-55 Hellcat (Unarmed)",
				"I_Heli_light_03_unarmed_F",
				["crew","crew"]
			],

			[
				"CH-49 Mohawk",
				"I_Heli_Transport_02_F",
				["crew","crew"]
			],

			[
				"WY-55 Hellcat",
				"I_Heli_light_03_F",
				["crew","crew"]
			]

		]

	]

];	// <-- Comma rule does not apply here - do not edit.

f_zeus_unitsStructure = _units; // Don't remove this line!
