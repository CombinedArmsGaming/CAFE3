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

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
	case "ftl":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d10_m320","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],["1Rnd_HE_Grenade_shell",1],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10],["UK3CB_BAF_9_17Rnd",2,17]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",2,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["SmokeShellBlue",1,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",4,30],["rhsusf_m112x4_mag",1,1]]],"UK3CB_BAF_H_Wool_Hat","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];
	};
	
	case "sl":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d10_m320","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],["1Rnd_HE_Grenade_shell",1],""],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10],["UK3CB_BAF_9_17Rnd",2,17]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",2,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["SmokeShellBlue",1,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",4,30],["rhsusf_m112x4_mag",1,1]]],"UK3CB_BAF_H_Wool_Hat","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];
	};
	
	case "rif":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d145","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],""],[],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",1,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",4,1],["SmokeShell",4,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",8,30],["rhsusf_m112x4_mag",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2,30]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "lat":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d145","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],""],["UK3CB_BAF_AT4_CS_AT_Launcher","","","",[],[],""],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",1,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",2,30],["rhsusf_m112x4_mag",1,1]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "ar":
	{
		_unit setUnitLoadout [["rhs_weap_m249_pip","sam_acca_reflex_tr8","","sma_spitfire_03_rds_low_black",["rhs_200rnd_556x45_B_SAW",200],[],""],[],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_200rnd_556x45_B_SAW",2,200]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhsusf_m112x4_mag",1,1],["rhs_200rnd_556x45_B_SAW",1,200]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "med":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d10","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],""],[],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",8,30],["hlc_30rnd_556x45_S",1,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1,30]]],["mpx_daysack8",[["ACE_Clacker",1],["ACE_bloodIV",8],["ACE_epinephrine",10],["ACE_fieldDressing",30],["ACE_morphine",30],["rhs_mag_m67",1,1],["SmokeShell",4,1],["rhsusf_m112x4_mag",1,1],["SmokeShellPurple",1,1]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "aar":
	{
		_unit setUnitLoadout [["rhs_weap_hk416d145","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],""],[],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",1,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhsusf_m112x4_mag",1,1],["rhs_200rnd_556x45_B_SAW",4,200]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	case "mk":
	{
		_unit setUnitLoadout [["UK3CB_BAF_L129A1","UK3CB_BAF_Silencer_L115A3","UK3CB_BAF_LLM_IR_Black","ACE_optic_SOS_2D",["ACE_20Rnd_762x51_M993_AP_Mag",20],[],"UK3CB_underbarrel_acc_bipod"],[],["UK3CB_BAF_L131A1","","","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_4para_uniform_kr",[["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10],["ACRE_PRC343",1]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["ACE_20Rnd_762x51_M993_AP_Mag",6,20],["UK3CB_BAF_762_L42A1_20Rnd_T",2,20]]],["mpx_daysack8",[["ACE_Clacker",1],["SmokeShell",4,1],["rhsusf_m112x4_mag",1,1],["ACE_20Rnd_762x51_M993_AP_Mag",3,20],["UK3CB_BAF_762_L42A1_20Rnd_T",1,20],["UK3CB_BAF_9_17Rnd",3,17],["SmokeShellOrange",1,1]]],"H_Booniehat_khk_hs","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};

// CRATE: Small, ammo for 1 fireteam
	case "crate_small":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["rhs_weap_hk416d145", 2];
		_unit addItemCargoGlobal ["UK3CB_BAF_AT4_CS_AT_Launcher", 2];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_morphine", 20];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];

		_unit addItemCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 10];
		_unit addItemCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T", 3];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_B_SAW", 5];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_T_SAW", 2];
		_unit addItemCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 30];
		_unit addItemCargoGlobal ["UK3CB_BAF_9_17Rnd", 4];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["mpx_daysack8", 2];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 5];
		_unit addItemCargoGlobal ["rhsusf_m112x4_mag", 6];
		_unit addItemCargoGlobal ["ACE_Clacker", 3];
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
		
		_unit addItemCargoGlobal ["rhs_weap_hk416d145", 2];
		_unit addItemCargoGlobal ["rhs_weap_hk416d10", 1];
		_unit addItemCargoGlobal ["UK3CB_BAF_L131A1", 2];
		_unit addItemCargoGlobal ["UK3CB_BAF_AT4_CS_AT_Launcher", 4];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 50];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 50];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];

		_unit addItemCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 30];
		_unit addItemCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T", 5];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_B_SAW", 10];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_T_SAW", 4];
		_unit addItemCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 100];
		_unit addItemCargoGlobal ["UK3CB_BAF_9_17Rnd", 10];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["mpx_daysack8", 6];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 10];
		_unit addItemCargoGlobal ["rhsusf_m112x4_mag", 12];
		_unit addItemCargoGlobal ["ACE_Clacker", 6];
		_unit addItemCargoGlobal ["SmokeShell", 10];
		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];

		_unit addItemCargoGlobal ["ACRE_PRC343", 12];
		_unit addItemCargoGlobal ["ACRE_PRC152", 4];
		_unit addItemCargoGlobal ["ACRE_PRC148", 3];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
};


case "jackal":
{
		
		_unit addItemCargoGlobal ["rhs_weap_hk416d145", 2];
		_unit addItemCargoGlobal ["rhs_weap_hk416d10", 1];
		_unit addItemCargoGlobal ["UK3CB_BAF_L131A1", 2];
		_unit addItemCargoGlobal ["UK3CB_BAF_AT4_CS_AT_Launcher", 4];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 50];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 50];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];

		_unit addItemCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 30];
		_unit addItemCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T", 5];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_B_SAW", 10];
		_unit addItemCargoGlobal ["rhs_200rnd_556x45_T_SAW", 4];
		_unit addItemCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag", 100];
		_unit addItemCargoGlobal ["UK3CB_BAF_9_17Rnd", 10];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["mpx_daysack8", 6];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 10];
		_unit addItemCargoGlobal ["rhsusf_m112x4_mag", 12];
		_unit addItemCargoGlobal ["ACE_Clacker", 6];
		_unit addItemCargoGlobal ["SmokeShell", 10];
		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];

		_unit addItemCargoGlobal ["ACRE_PRC343", 12];
		_unit addItemCargoGlobal ["ACRE_PRC152", 4];
		_unit addItemCargoGlobal ["ACRE_PRC148", 3];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit setUnitLoadout [["rhs_weap_hk416d145","rhsusf_acc_nt4_black","UK3CB_BAF_LLM_Flashlight_Black","sma_spitfire_03_rds_low_black",["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],[],""],["UK3CB_BAF_AT4_CS_AT_Launcher","","","",[],[],""],[],["mpx_mtp_4para_uniform_kr",[["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACE_fieldDressing",10]]],["mpx_virtus_taco2",[["1Rnd_HE_Grenade_shell",10,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",6,30],["hlc_30rnd_556x45_S",1,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1,30]]],["mpx_daysack8",[["ACE_Clacker",1],["rhs_mag_m67",2,1],["SmokeShell",2,1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",2,30],["rhsusf_m112x4_mag",1,1]]],"mpx_cobra_patch","rhs_googles_orange",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

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
