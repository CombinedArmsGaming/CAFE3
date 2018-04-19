// F3 - Folk ARPS Assign Gear Script - AAF
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
//		uav			- UAV operator
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

_scope1 = "optic_ACO_grn";		// ACO
_scope2 = "optic_MRCO";			// MRCO Scope - 1x - 6x
_scope3 = "optic_SOS";			// SOS Scope - 18x - 75x

_bipod1 = "bipod_03_F_oli";		// Default bipod
_bipod2 = "bipod_03_F_blk";		// Black bipod

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
_rifle = "arifle_Mk20_F";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "arifle_Mk20C_F";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_02_F";
_smgmag = "30Rnd_9x21_Mag";
_smgmag_tr = "30Rnd_9x21_Mag";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_Mk20_GL_MRCO_pointer_F";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "UGL_FlareWhite_F";
_glflarered = "UGL_FlareRed_F";
_glflareyellow = "UGL_FlareYellow_F";
_glflaregreen = "UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_ACPC2_F";
_pistolmag = "9Rnd_45ACP_Mag";

// Grenades
_grenade = "HandGrenade";
_Mgrenade = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles_INDEP";

// UAV Terminal
_uavterminal = "I_UavTerminal";

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bagsmall = "B_AssaultPack_khk";			// carries 120, weighs 20
_bagmedium = "B_FieldPack_oli";				// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 				// carries 320, weighs 40
_bagmediumdiver =  "B_AssaultPack_blk";		// used by divers
_baguav = "I_UAV_01_backpack_F";			// used by UAV operator
_baghmgg = "I_HMG_01_weapon_F";				// used by Heavy MG gunner
_baghmgag = "I_HMG_01_support_F";			// used by Heavy MG assistant gunner
_baghatg = "I_AT_01_weapon_F";				// used by Heavy AT gunner
_baghatag = "I_HMG_01_support_F";			// used by Heavy AT assistant gunner
_bagmtrg = "I_Mortar_01_weapon_F";			// used by Mortar gunner
_bagmtrag = "I_Mortar_01_support_F";		// used by Mortar assistant gunner
_baghsamg = "I_AA_01_weapon_F";				// used by Heavy SAM gunner
_baghsamag = "I_HMG_01_support_F";			// used by Heavy SAM assistant gunner

//TFR RADIO BACKPACK
//Check if TFR is the radio addon is used
if(f_var_radios == 2) then {
	//Designate radio backpack that is to be used.
	_bagradio = "tf_anprc155";  //Remember to use "" for classnames eg "tf_rt1523g_sage"

	// Unit types you want to give long-range radios if previous is
	// E.G: ["co", "m"] would give the CO and all medics  long-range radios
	_backpackradiotypes = ["co","dc"];

		if(_typeOfUnit in _backpackradiotypes) then {
			_bagsmall = _bagradio;
			_bagmedium = _bagradio;
			_baglarge = _bagradio;
		};
};
// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "LMG_Mk200_F";
_ARmag = "200Rnd_65x39_cased_Box";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer";

// Medium MG
_MMG = "MMG_01_tan_F";
_MMGmag = "150Rnd_93x64_Mag";
_MMGmag_tr = "150Rnd_93x64_Mag";

// NON-DLC ALTERNATIVE:
//_MMG = "LMG_Zafir_F";
//_MMGmag = ""150Rnd_762x54_Box"";
//_MMGmag_tr = ""150Rnd_762x54_Box"_Tracer";

// Marksman rifle
_DMrifle = "srifle_EBR_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Rifleman AT
_RAT = "launch_RPG32_F";
_RATmag = "RPG32_F";

// Medium AT
_MAT = "launch_NLAW_F";
_MATmag1 = "NLAW_F";
_MATmag2 = "NLAW_F";

// Surface Air
_SAM = "launch_I_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_I_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

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

_baseUniform = ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt"];
_baseHelmet = ["H_HelmetIA_net","H_HelmetIA_camo","H_HelmetIA"];
_baseGlasses = [];

// Vests
_lightRig = ["V_Chestrig_oli","V_BandollierB_oli"];
_mediumRig = ["V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl"]; 	// default for all infantry classes
_heavyRig = ["V_PlateCarrierIAGL_dgtl"];

// Diver
_diverUniform =  ["U_I_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIA"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_I_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_I"];
_pilotRig = ["V_TacVest_oli"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["U_I_CombatUniform"];
_crewHelmet = ["H_HelmetCrew_I"];
_crewRig = ["V_TacVest_oli"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_I_GhillieSuit"];	//DLC alternatives: ["U_I_FullGhillie_lsh","U_I_FullGhillie_ard","U_I_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_oli"];
_ghillieGlasses = [];

// Spec Op - no nice stuff for AAF
_sfuniform = _baseUniform;
_sfhelmet = _baseHelmet;
_sfRig = _mediumRig;
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following interprets what has been passed to this script element

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
	_loadout = f_param_backpacks;
	if (count _this > 1) then {_loadout = _this select 1};
	switch (_typeofBackPack) do
	{
		#include "f_assignGear_aaf_b.sqf";
	};
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================



	case "aar":
	{
		_unit setUnitLoadout [["rhs_weap_pm63","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_AM_Fatigue_02_4",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["rhs_mag_rgd5",1,1],["rhs_30Rnd_762x39mm",3,30],["rhs_mag_rdg2_white",2,1]]],["V_BandollierB_rgr",[["rhs_mag_f1",1,1],["hlc_30Rnd_762x39_b_ak",5,30]]],["rhs_sidor",[["rhs_100Rnd_762x54mmR",2,100]]],"LOP_H_Turban_mask","",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "ar":
	{
		_rifLoadouts = 
		[
			[["rhs_weap_pkm","","","",["rhs_100Rnd_762x54mmR_green",100],[],""],[],[],["LOP_U_AFR_Fatigue_03",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["rhs_mag_rgd5",1,1]]],["rhsgref_6b23_ttsko_digi_rifleman",[["rhs_100Rnd_762x54mmR_green",1,100]]],["rhs_sidor",[["rhs_100Rnd_762x54mmR",2,100]]],"H_ShemagOpen_khk","G_Shades_Black",[],["ItemMap","","","ItemCompass","",""]],
			[["hlc_rifle_rpk","","","",["hlc_45Rnd_762x39_t_rpk",45],[],""],[],[],["LOP_U_AM_Fatigue_03",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["ACRE_PRC343",1],["rhs_mag_rgd5",1,1],["rhs_mag_rdg2_white",2,1]]],["LOP_V_6B23_M81",[["hlc_45Rnd_762x39_t_rpk",1,45]]],["rhs_sidor",[["hlc_75Rnd_762x39_m_rpk",4,75]]],"LOP_H_Turban","SFG_Tac_BeardD",[],["ItemMap","","","ItemCompass","",""]]
		];
	
		_randomLoadout = selectRandom _rifLoadouts;
	
		_unit setUnitLoadout _randomLoadout;
	};
	
	case "ftl":
	{
		_unit setUnitLoadout [["rhs_weap_akms_gp25","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_ISTS_Fatigue_17",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC152",1]]],["V_TacChestrig_oli_F",[["hlc_30Rnd_762x39_b_ak",7,30],["rhs_VOG25",6,1],["rhs_GDM40",2,1],["rhs_GRD40_Red",2,1]]],["B_LegStrapBag_black_F",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_Cellphone",1],["UMI_Land_Camcorder_F",1],["ACE_Banana",2]]],"LOP_H_Turban","rhsusf_shemagh_od",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "lat":
	{
		_unit setUnitLoadout [["rhs_weap_akms","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],["rhs_weap_rpg26","","","",[],[],""],[],["LOP_U_AM_Fatigue_03",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["rhs_mag_rgd5",1,1],["rhs_30Rnd_762x39mm",3,30],["SmokeShell",1,1],["hlc_30Rnd_762x39_b_ak",2,30]]],[],["B_FieldPack_khk",[["hlc_30Rnd_762x39_b_ak",6,30]]],"H_ShemagOpen_tan","G_Shades_Black",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "mat":
	{
		_unit setUnitLoadout [["rhs_weap_aks74un","rhs_acc_pgs64_74un","","",["hlc_30Rnd_545x39_t_ak",30],[],""],["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],[],["LOP_U_AM_Fatigue_03",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["rhs_mag_rgd5",1,1],["rhs_30Rnd_545x39_AK",6,30]]],["V_LegStrapBag_black_F",[]],["rhs_rpg_empty",[["rhs_rpg7_PG7V_mag",2,1],["rhs_rpg7_OG7V_mag",2,1]]],"H_ShemagOpen_tan","G_Shades_Black",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "med":
	{
		_unit setUnitLoadout [["rhs_weap_aks74un","rhs_acc_pgs64_74un","","",["hlc_30Rnd_545x39_t_ak",30],[],""],[],[],["LOP_U_AM_Fatigue_04",[["ACE_fieldDressing",5],["ACE_morphine",5],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_bloodIV",1],["rhs_mag_rdg2_white",2,1],["rhs_30Rnd_545x39_AK",6,30]]],[],["rhs_medic_bag",[["ACE_fieldDressing",18],["ACE_bloodIV",5],["ACE_epinephrine",8],["ACE_morphine",18],["ACE_Banana",1]]],"H_ShemagOpen_khk","rhsusf_shemagh2_tan",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "mk":
	{
		_unit setUnitLoadout [["rhs_weap_svdp","","","rhs_acc_pso1m2",["rhs_10Rnd_762x54mmR_7N1",10],[],""],[],[],["LOP_U_AFR_Fatigue_01",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["ACRE_PRC343",1],["rhs_mag_rgd5",1,1],["SmokeShell",2,1]]],["rhsgref_alice_webbing",[["UMI_Land_Camcorder_F",1],["rhs_10Rnd_762x54mmR_7N1",6,10]]],[],"LOP_H_Turban","rhsusf_shemagh2_grn",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	
	case "rif":
	{
		_rifLoadouts = 
		[
			[["rhs_weap_pm63","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_AM_Fatigue_02_6",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_500",1],["rhs_mag_rgd5",1,1],["rhs_30Rnd_762x39mm",3,30],["rhs_mag_rdg2_white",2,1]]],["V_BandollierB_rgr",[["rhs_mag_f1",1,1],["hlc_30Rnd_762x39_b_ak",5,30]]],[],"LOP_H_Turban_mask","",[],["ItemMap","","","ItemCompass","",""]],
			[["rhs_weap_akm","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_AM_Fatigue_03_4",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_bloodIV_500",1],["ACE_epinephrine",1],["rhs_mag_rgd5",1,1],["hlc_30Rnd_762x39_b_ak",6,30],["rhs_mag_an_m8hc",1,1]]],[],["B_LegStrapBag_coyote_F",[["DemoCharge_Remote_Mag",2,1]]],"H_ShemagOpen_tan","",[],["ItemMap","","","ItemCompass","",""]],
			[["rhs_weap_m92","","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_BH_Fatigue_CHOCO_LIZ",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_epinephrine",1],["ACE_bloodIV_250",1],["ACRE_PRC343",1],["rhs_mag_rgd5",1,1]]],["LOP_V_CarrierLite_OLV",[["rhs_mag_f1",1,1],["hlc_30Rnd_762x39_b_ak",6,30],["rhs_mag_rdg2_white",2,1]]],[],"LOP_H_Shemag_TAN","",[],["ItemMap","","","ItemCompass","",""]],
			[["hlc_rifle_aks74u_MTK","","","",["hlc_30Rnd_545x39_t_ak",30],[],""],[],[],["LOP_U_BH_Fatigue_FWDL",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_250",1],["rhs_mag_rgd5",1,1]]],["LOP_V_Carrier_OLV",[["rhs_30Rnd_545x39_AK",4,30]]],[],"LOP_H_Shemag_GRE","",[],["ItemMap","","","ItemCompass","",""]]
		];
	
		_randomLoadout = selectRandom _rifLoadouts;
	
		_unit setUnitLoadout _randomLoadout;
	};
	
	case "sl":
	{
		_unit setUnitLoadout [["rhs_weap_akms_gp25","rhs_acc_dtkakm","","",["hlc_30Rnd_762x39_t_ak",30],[],""],[],[],["LOP_U_ISTS_Fatigue_17",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC152",1]]],["V_TacChestrig_oli_F",[["hlc_30Rnd_762x39_b_ak",7,30],["rhs_VOG25",6,1],["rhs_GDM40",2,1],["rhs_GRD40_Red",2,1]]],["B_LegStrapBag_black_F",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_Cellphone",1],["UMI_Land_Camcorder_F",1],["ACE_Banana",2]]],"LOP_H_Turban","rhsusf_shemagh_od",[],["ItemMap","","","ItemCompass","",""]];
	};
	
	case "zeus":
	{
		_unit setUnitLoadout [["rhs_weap_ak103_zenitco01_b33","rhs_acc_dtk4long","ACE_acc_pointer_green","optic_ACO_grn_smg",["hlc_75Rnd_762x39_AP_rpk",75],[],"rhsusf_acc_grip1"],[],["rhs_weap_tr8","","","",[],[],""],["LOP_U_AA_Fatigue_02_slv",[["ACE_fieldDressing",10],["ACE_morphine",10],["ACRE_PRC152",1],["ACRE_PRC343",1],["ACE_epinephrine",1],["ACE_bloodIV_250",1]]],["LOP_V_6B23_Rifleman_M81",[["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",4,1]]],["SOUP_Kitbag_PACT_SHADOW",[["ACRE_PRC148",1],["hlc_75Rnd_762x39_AP_rpk",6,75]]],"H_Shemag_olive_hs","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];
	};
	
	

// CRATE: Small, ammo for 1 fireteam
	case "crate_small":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["RH_M16A2", 2];
		_unit addItemCargoGlobal ["rhs_weap_M136", 2];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_morphine", 20];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];

		_unit addItemCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 10];
		_unit addItemCargoGlobal ["rhs_100Rnd_762x54mmR", 5];
		_unit addItemCargoGlobal ["rhs_100Rnd_762x54mmR_green", 2];
		_unit addItemCargoGlobal ["RH_30Rnd_556x45_M855A1", 30];
		_unit addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 6];
		_unit addItemCargoGlobal ["rhsusf_mag_15Rnd_9x19_FMJ", 4];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["B_Kitbag_cbr", 2];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 5];
		_unit addItemCargoGlobal ["SmokeShell", 5];
		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];
		
		_unit addItemCargoGlobal ["rhs_rpg7_PG7V_mag", 4];
		_unit addItemCargoGlobal ["rhs_rpg7_PG7VL_mag", 2];

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
		
		_unit addItemCargoGlobal ["RH_M16A2", 2];
		_unit addItemCargoGlobal ["RH_m4", 1];
		_unit addItemCargoGlobal ["rhsusf_weap_m9", 2];
		_unit addItemCargoGlobal ["rhs_weap_M136", 4];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 50];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 50];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];

		_unit addItemCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 30];
		_unit addItemCargoGlobal ["rhs_100Rnd_762x54mmR", 10];
		_unit addItemCargoGlobal ["rhs_100Rnd_762x54mmR_green", 4];
		_unit addItemCargoGlobal ["RH_30Rnd_556x45_M855A1", 100];
		_unit addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red", 20];
		_unit addItemCargoGlobal ["rhsusf_mag_15Rnd_9x19_FMJ", 10];
		_unit addItemCargoGlobal ["1Rnd_HE_Grenade_shell", 20];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["B_Kitbag_cbr", 6];
		
		_unit addItemCargoGlobal ["rhs_mag_m67", 10];
		_unit addItemCargoGlobal ["SmokeShell", 10];
		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];
		
		_unit addItemCargoGlobal ["rhs_rpg7_PG7V_mag", 10];
		_unit addItemCargoGlobal ["rhs_rpg7_PG7VL_mag", 5];

		_unit addItemCargoGlobal ["ACRE_PRC343", 12];
		_unit addItemCargoGlobal ["ACRE_PRC152", 4];
		_unit addItemCargoGlobal ["ACRE_PRC148", 3];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addmagazines [_riflemag,7];
		_unit addweapon _rifle;

		_unit selectweapon primaryweapon _unit;

		if (true) exitwith {player globalchat format ["DEBUG (f\assignGear\f_assignGear_aaf.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
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
