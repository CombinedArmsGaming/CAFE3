// F3 - Folk ARPS Assign Gear Script - NATO
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//		co			- commander
//		dc 			- deputy commander / squad leader
//		m 			- medic
//		ftl			- fire team leader
//		ar 			- automatic rifleman
//		aar			- assistant automatic rifleman
//		rat			- rifleman (AT)
//		dm			- designated marksman
//		mmgg		- medium mg gunner
//		mmgag		- medium mg assistant
//		matg		- medium AT gunner
//		matag		- medium AT assistant
//		hmgg		- heavy mg gunner (deployable)
//		hmgag		- heavy mg assistant (deployable)
//		hatg		- heavy AT gunner (deployable)
//		hatag		- heavy AT assistant (deployable)
//		mtrg		- mortar gunner (deployable)
//		mtrag		- mortar assistant (deployable)
//		msamg		- medium SAM gunner
//		msamag		- medium SAM assistant gunner
//		hsamg		- heavy SAM gunner (deployable)
//		hsamag		- heavy SAM assistant gunner (deployable)
//		sn			- sniper
//		sp			- spotter (for sniper)
//		vc			- vehicle commander
//		vg			- vehicle gunner
//		vd			- vehicle driver (repair)
//		pp			- air vehicle pilot / co-pilot
//		pcc			- air vehicle co-pilot (repair) / crew chief (repair)
//		pc			- air vehicle crew
//		eng			- engineer (demo)
//		engm		- engineer (mines)
//		uav			- UAV operator"
//		div    		- divers
//
//		r 			- rifleman
//		car			- carabineer
//		smg			- submachinegunner
//		gren		- grenadier
//
//		v_car		- car/4x4
//		v_tr		- truck
//		v_ifv		- ifv
//
//		crate_small	- small ammocrate
//		crate_med	- medium ammocrate
//		crate_large	- large ammocrate
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// ATTACHMENTS - PRIMARY
_attach1 = "acc_pointer_IR";	// IR Laser
_attach2 = "acc_flashlight";	// Flashlight

_silencer1 = "muzzle_snds_M";	// 5.56 suppressor
_silencer2 = "muzzle_snds_H";	// 6.5 suppressor

_scope1 = "optic_Holosight";	// Holosight
_scope2 = "optic_MRCO";			// MRCO Scope - 1x - 6x
_scope3 = "optic_SOS";			// SOS Scope - 18x - 75x

_bipod1 = "bipod_01_F_snd";		// Default bipod
_bipod2 = "bipod_02_F_blk";		// Black bipod

// Default setup
_attachments = [_attach1,_scope1]; // The default attachment set for most units, overwritten in the individual unitType

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1, _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ====================================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor

_hg_scope1 = "optic_MRD";			// MRD

// Default setup
_hg_attachments= []; // The default attachment set for handguns, overwritten in the individual unitType

// ====================================================================================

// WEAPON SELECTION

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "arifle_MX_pointer_F";
_riflemag = "30Rnd_65x39_caseless_mag";
_riflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_MXC_F";
_carbinemag = "30Rnd_65x39_caseless_mag";
_carbinemag_tr = "30Rnd_65x39_caseless_mag_Tracer";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_01_F";
_smgmag = "30Rnd_45ACP_Mag_SMG_01";
_smgmag_tr = "30Rnd_45ACP_Mag_SMG_01_tracer_green";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_MX_GL_F";
_glriflemag = "30Rnd_65x39_caseless_mag";
_glriflemag_tr = "30Rnd_65x39_caseless_mag_Tracer";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "3Rnd_UGL_FlareWhite_F";
_glflarered = "3Rnd_UGL_FlareRed_F";
_glflareyellow = "3Rnd_UGL_FlareYellow_F";
_glflaregreen = "3Rnd_UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_Pistol_heavy_01_F";
_pistolmag = "11Rnd_45ACP_Mag";

// Grenades
_grenade = "HandGrenade";
_Mgrenade = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles";

// UAV Terminal
_uavterminal = "B_UavTerminal";	  // BLUFOR - FIA

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bagsmall = "B_AssaultPack_mcamo";			// carries 120, weighs 20
_bagmedium = "B_FieldPack_khk";				// carries 240, weighs 30
_baglarge =  "B_Carryall_mcamo"; 			// carries 320, weighs 40
_bagmediumdiver =  "B_AssaultPack_blk";		// used by divers
_baguav = "B_UAV_01_backpack_F";			// used by UAV operator
_baghmgg = "B_HMG_01_weapon_F";				// used by Heavy MG gunner
_baghmgag = "B_HMG_01_support_F";			// used by Heavy MG assistant gunner
_baghatg = "B_AT_01_weapon_F";				// used by Heavy AT gunner
_baghatag = "B_HMG_01_support_F";			// used by Heavy AT assistant gunner
_bagmtrg = "B_Mortar_01_weapon_F";			// used by Mortar gunner
_bagmtrag = "B_Mortar_01_support_F";		// used by Mortar assistant gunner
_baghsamg = "B_AA_01_weapon_F";				// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";			// used by Heavy SAM assistant gunner

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "arifle_MX_SW_F";
_ARmag = "100Rnd_65x39_caseless_mag";
_ARmag_tr = "100Rnd_65x39_caseless_mag_Tracer";

// Medium MG
_MMG = "MMG_02_sand_F";
_MMGmag = "130Rnd_338_Mag";
_MMGmag_tr = "130Rnd_338_Mag";

// NON-DLC ALTERNATIVE:
// _MMG = "LMG_Zafir_F";
// _MMGmag = ""150Rnd_762x54_Box"";
// _MMGmag_tr = ""150Rnd_762x54_Box"_Tracer";

// Marksman rifle
_DMrifle = "srifle_DMR_03_tan_F";
_DMriflemag = "20Rnd_762x51_Mag";

// MAR-10
//_DMrifle = "srifle_DMR_02_F";
//_DMriflemag = "10Rnd_338_Mag";

// Rifleman AT
_RAT = "launch_NLAW_F";
_RATmag = "NLAW_F";

// Medium AT
_MAT = "launch_NLAW_F";
_MATmag1 = "NLAW_F";
_MATmag2 = "NLAW_F";

// Surface Air
_SAM = "launch_B_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_B_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = "srifle_LRR_F";
_SNrifleMag = "7Rnd_408_Mag";

// Engineer items
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ====================================================================================

// CLOTHES AND UNIFORMS

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific uniform

_light = [];
_heavy =  ["eng","engm"];
_diver = ["div"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit
_baseUniform = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest"];
_baseHelmet = ["H_HelmetB","H_HelmetB_plain_mcamo"];
_baseGlasses = [];

// Vests
_lightRig = ["V_BandollierB_cbr","V_BandollierB_khk"];
_mediumRig = ["V_PlateCarrier1_rgr","V_PlateCarrier2_rgr"]; 	// default for all infantry classes
_heavyRig = ["V_PlateCarrier3_rgr"];

// Diver
_diverUniform =  ["U_B_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherB"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["U_B_CombatUniform_mcam_vest"];
_crewHelmet = ["H_HelmetCrew_B"];
_crewRig = ["V_TacVest_blk"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"]; //DLC alternatives: ["U_B_FullGhillie_lsh","U_B_FullGhillie_ard","U_B_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// Spec Op
_sfuniform = ["U_B_SpecopsUniform_sgg"];
_sfhelmet = ["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk"];
_sfRig = ["V_PlateCarrierSpec_rgr"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

		// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

	// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

	// ====================================================================================

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of this faction

	_unit linkItem _nvg;					// Add and equip the faction's nvg
	_unit addItem _firstaid;				// Add a single first aid kit (FAK)
	_unit linkItem "ItemMap";				// Add and equip the map
	_unit linkItem "ItemCompass";			// Add and equip a compass
	_unit linkItem "ItemRadio";				// Add and equip A3's default radio
	_unit linkItem "ItemWatch";				// Add and equip a watch
	//_unit linkItem "ItemGPS"; 			// Add and equip a GPS

  // ADD ACE ITEMS
	_unit addItem "ACE_Flashlight_XL50";	// Add a flashlight for ACE map support.
	_unit addItem "ACE_Maptools";

	// Add medical items
	{_unit addItem "ACE_fieldDressing"} forEach [1,2,3,4,5,6,7,8]; // Bandages
	{_unit addItem "ACE_morphine"} forEach [1,2,3,4];
	//{_unit addItem "ACE_epinephrine"} forEach [1,2];
	//{_unit addItem "ACE_bloodIV"} forEach [1,2];

};


// ====================================================================================

// SETUP BACKPACKS
// Include the correct backpack file for the faction

_backpack = {
	_typeofBackPack = _this select 0;
	_loadout = 1;
	if (count _this > 1) then {_loadout = _this select 1};
	switch (_typeofBackPack) do
	{
		#include "f_assignGear_nato_b.sqf";
	};
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

_pickUniform = 
{
	_items = ["Cre8ive_Bw_Uniform_W_1", "Cre8ive_Bw_Uniform_W_2"];
	
	selectRandom _items
	
};


_pickVest = 
{
	_items = ["Cre8ive_Bw_Vest_W_1", "Cre8ive_Bw_Vest_W_2"];
	
	selectRandom _items
	
};


_pickHelmet = 
{
	_items = ["Cre8ive_Bw_Helmet_W", "Cre8ive_Bw_Helmet_W", "rhsusf_mich_bare_norotos_arc_alt", "rhsusf_opscore_fg_pelt", "H_HelmetSpecB_paint1", "rhsusf_ach_bare"];
	
	selectRandom _items
	
};


_pickMuzzle = 
{
	_items = ["", "", "ACE_muzzle_mzls_L", "rhsusf_acc_SF3P556", "rhsusf_acc_SFMB556"];
	
	selectRandom _items
	
};


_pickRail = 
{
	_items = ["", "", "acc_flashlight", "FHQ_acc_LLM01F", "UK3CB_BAF_LLM_Flashlight_Black", "acc_pointer_IR", "ACE_acc_pointer_green"];
	
	selectRandom _items
	
};


_pickBackpack = 
{
	_items = ["Cre8ive_Bw_Assault_W", "Cre8ive_Bw_Assault_W", "Cre8ive_Bw_Kitbag_W", "Cre8ive_Bw_Kitbag_W", "Cre8ive_Bw_Carryall_W"];
	
	selectRandom _items
	
};




switch (_typeofUnit) do
{

// ====================================================================================

	case "aar":
	{
		_unit setUnitLoadout [["hlc_rifle_G36V",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",3,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",5,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["hlc_100Rnd_792x57_AP_MG42",3,100],["hlc_30rnd_556x45_EPR_G36",1,30]]],[] call _pickHelmet,"",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "ar":
	{
		_unit setUnitLoadout [["hlc_lmg_mg42kws_b","",[] call _pickRail,"optic_MRCO",["hlc_100Rnd_792x57_AP_MG42",100],[],""],[],[],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",1,1],["SmokeShell",1,1],["hlc_100Rnd_792x57_M_MG42",1,100]]],[[] call _pickBackpack,[["ACE_CableTie",2],["hlc_100Rnd_792x57_AP_MG42",3,100]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "co":
	{
		_unit setUnitLoadout [["hlc_rifle_G36KV",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC148",1]]],[[] call _pickVest,[["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",6,30],["hlc_30rnd_556x45_Tracers_G36",1,30],["SmokeShellGreen",2,1]]],[],"usm_bdu_8point_wdl","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "ftl":
	{
		_unit setUnitLoadout [["hlc_rifle_G36VAG36",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],["1Rnd_HE_Grenade_shell",1],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC152",1]]],[[] call _pickVest,[["rhs_mag_m67",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["SmokeShellRed",1,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",3,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["1Rnd_HE_Grenade_shell",10,1],["1Rnd_Smoke_Grenade_shell",3,1],["1Rnd_SmokeGreen_Grenade_shell",2,1],["1Rnd_SmokePurple_Grenade_shell",2,1],["hlc_30rnd_556x45_EPR_G36",5,30]]],[] call _pickHelmet,"",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "sl":
	{
		_unit setUnitLoadout [["hlc_rifle_G36VAG36",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],["1Rnd_HE_Grenade_shell",1],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC152",1]]],[[] call _pickVest,[["rhs_mag_m67",2,1],["SmokeShell",2,1],["SmokeShellGreen",1,1],["SmokeShellRed",1,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",3,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["1Rnd_HE_Grenade_shell",10,1],["1Rnd_Smoke_Grenade_shell",3,1],["1Rnd_SmokeGreen_Grenade_shell",2,1],["1Rnd_SmokePurple_Grenade_shell",2,1],["hlc_30rnd_556x45_EPR_G36",5,30]]],[] call _pickHelmet,"",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "lat":
	{
		_unit setUnitLoadout [["hlc_rifle_G36V",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],["UK3CB_BAF_AT4_CS_AP_Launcher","","","",[],[],""],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",3,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",5,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["hlc_30rnd_556x45_EPR_G36",5,30]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "med":
	{
		_unit setUnitLoadout [["hlc_rifle_G36KV",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",6,30],["hlc_30rnd_556x45_Tracers_G36",1,30],["SmokeShellGreen",2,1]]],[[] call _pickBackpack,[["ACE_CableTie",2],["ACE_bloodIV",10],["ACE_fieldDressing",24],["ACE_epinephrine",10],["ACE_morphine",24]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "mk":
	{
		_unit setUnitLoadout [["hlc_rifle_g3sg1ris","","","optic_SOS",["hlc_20rnd_762x51_b_G3",20],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",2,1],["SmokeShell",3,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_20rnd_762x51_b_G3",5,20]]],[[] call _pickBackpack,[["ACE_CableTie",2],["rhs_mag_m67",1,1],["hlc_20rnd_762x51_T_G3",2,20]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "rif":
	{
		_unit setUnitLoadout [["hlc_rifle_G36V",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",3,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",5,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["hlc_30rnd_556x45_EPR_G36",8,30],["hlc_30rnd_556x45_Tracers_G36",2,30],["rhs_mag_m67",1,1]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};	
	
	case "zeus":
	{
		_unit setUnitLoadout [["rhs_weap_kar98k","","","",["rhsgref_5Rnd_792x57_kar98k",5],[],""],[],["hlc_smg_mp5k","","","",["hlc_30Rnd_9x19_B_MP5",30],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC148",1]]],["LOP_V_6B23_6Sh92_UN",[["rhs_mag_m67",2,1],["SmokeShell",2,1],["SmokeShellGreen",2,1],["rhsgref_5Rnd_792x57_kar98k",10,5],["hlc_30Rnd_9x19_B_MP5",3,30]]],[],"rhsgref_un_beret","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "journo_mic":
	{
		_unit setUnitLoadout [[],[],["Press_Mic_BBC_F","","","",[],[],""],["Cre8ive_CU_Uniform_Polo_Grey",[["ACE_fieldDressing",4],["ACE_epinephrine",1],["ACE_morphine",2]]],["V_Press_F",[]],[],"H_Cap_press","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "journo_cam":
	{
		_unit setUnitLoadout [[],["Press_Cam_F","","","",["Tape_F",1],[],""],[],["Cre8ive_CU_Uniform_Polo_Khaki",[["ACE_fieldDressing",4],["ACE_epinephrine",1],["ACE_morphine",2]]],["V_Press_F",[]],[],"H_Cap_press","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "crew":
	{
		_unit setUnitLoadout [["hlc_rifle_G36CV",[] call _pickMuzzle,[] call _pickRail,"SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],[],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC148",1]]],["V_TacVest_oli",[["rhs_mag_m67",2,1],["SmokeShell",3,1],["hlc_30rnd_556x45_EPR_G36",4,30],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["hlc_30rnd_556x45_Tracers_G36",1,30]]],["Cre8ive_Bw_Assault_W",[["ToolKit",1]]],"rhs_tsh4","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	

// CRATE: Small, ammo for 1 fireteam
	case "crate_small":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["hlc_rifle_G36V", 2];
		_unit addItemCargoGlobal ["SMA_AIMPOINT", 2];
		_unit addItemCargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher", 2];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_morphine", 20];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];

		_unit addItemCargoGlobal ["hlc_20rnd_762x51_b_G3", 5];
		_unit addItemCargoGlobal ["hlc_100Rnd_792x57_AP_MG42", 6];
		_unit addItemCargoGlobal ["hlc_30rnd_556x45_EPR_G36", 30];
		_unit addItemCargoGlobal ["hlc_30rnd_556x45_Tracers_G36", 6];
		_unit addItemCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 4];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal [[] call _pickBackpack, 2];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 5];
		_unit addItemCargoGlobal ["SmokeShell", 5];
		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];

		_unit addItemCargoGlobal ["ACRE_PRC343", 6];
		_unit addItemCargoGlobal ["ACRE_PRC152", 2];
		_unit addItemCargoGlobal ["ACRE_PRC148", 2];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
	};

// CRATE: Medium, ammo for 1 squad
	case "crate_med":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["hlc_rifle_G36V", 4];
		_unit addItemCargoGlobal ["SMA_AIMPOINT", 4];
		_unit addItemCargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher", 4];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 40];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 40];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];

		_unit addItemCargoGlobal ["hlc_20rnd_762x51_b_G3", 10];
		_unit addItemCargoGlobal ["hlc_100Rnd_792x57_AP_MG42", 12];
		_unit addItemCargoGlobal ["hlc_30rnd_556x45_EPR_G36", 60];
		_unit addItemCargoGlobal ["hlc_30rnd_556x45_Tracers_G36", 12];
		_unit addItemCargoGlobal ["rhsusf_mag_15Rnd_9x19_JHP", 8];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 2];

		_unit addItemCargoGlobal [[] call _pickBackpack, 4];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 10];
		_unit addItemCargoGlobal ["SmokeShell", 10];
		_unit addItemCargoGlobal ["SmokeShellGreen", 4];
		_unit addItemCargoGlobal ["SmokeShellPurple", 4];

		_unit addItemCargoGlobal ["ACRE_PRC343", 12];
		_unit addItemCargoGlobal ["ACRE_PRC152", 4];
		_unit addItemCargoGlobal ["ACRE_PRC148", 4];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
	};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit setUnitLoadout [["hlc_rifle_G36V","","","SMA_AIMPOINT",["hlc_30rnd_556x45_EPR_G36",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_JHP",15],[],""],[[] call _pickUniform,[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],[[] call _pickVest,[["rhs_mag_m67",3,1],["SmokeShell",2,1],["rhsusf_mag_15Rnd_9x19_FMJ",2,15],["hlc_30rnd_556x45_EPR_G36",5,30],["hlc_30rnd_556x45_Tracers_G36",3,30]]],[[] call _pickBackpack,[["ACE_CableTie",2],["hlc_30rnd_556x45_EPR_G36",8,30],["hlc_30rnd_556x45_Tracers_G36",2,30],["rhs_mag_m67",1,1]]],[] call _pickHelmet,"",["","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

		if (true) exitwith {player globalchat format ["DEBUG (f\assignGear\f_assignGear_nato.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================


// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;
