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

//TFR RADIO BACKPACK
//Check if TFR is the radio addon is used
if(f_var_radios == 2) then {
	//Designate radio backpack that is to be used.
	_bagradio = "tf_rt1523g";  //Remember to use "" for classnames eg "tf_rt1523g_sage"

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
	_loadout = f_param_backpacks;
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

	case "co":
	{
		_unit setUnitLoadout [["rhs_weap_aks74un","rhs_acc_pgs64_74un","","",["rhs_30Rnd_545x39_AK",30],[],""],[],["rhs_weap_tt33","","","",["rhs_mag_762x25_8",8],[],""],["LOP_U_CHR_SchoolTeacher_01",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_Messenger_IDAP_F",[["ACRE_PRC152",1],["SmokeShell",2,1],["SmokeShellPurple",1,1],["rhs_30Rnd_545x39_AK",6,30],["rhs_30Rnd_545x39_AK_green",2,30],["rhs_mag_762x25_8",4,8]]],"H_Beret_gen_F","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "mo-tube":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_Hoodie_Orange",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_BandollierB_khk",[["hlc_30Rnd_762x39_b_ak",4,30],["hlc_30Rnd_762x39_t_ak",2,30]]],["B_Mortar_01_weapon_F",[]],"H_Cap_blu","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "mo-legs":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_Hoodie_Green_Scarf",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_BandollierB_oli",[["hlc_30Rnd_762x39_b_ak",4,30],["hlc_30Rnd_762x39_t_ak",2,30]]],["B_Mortar_01_support_F",[]],"H_Cap_grn_BI","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "at-tube":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_Hoodie_White_Scarf",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_BandollierB_oli",[["hlc_30Rnd_762x39_b_ak",4,30],["hlc_30Rnd_762x39_t_ak",2,30]]],["RHS_SPG9_Gun_Bag",[]],"Cre8ive_Bw_Boonie_D","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "at-legs":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_Hoodie_Red",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_BandollierB_oli",[["hlc_30Rnd_762x39_b_ak",4,30],["hlc_30Rnd_762x39_t_ak",2,30]]],["RHS_SPG9_Tripod_Bag",[]],"rhsgref_Booniehat_alpen","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "veh-drv":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_Sports_TShirt_Black_Blue",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_TacticalPack_blk",[["ACRE_PRC152",1],["ToolKit",1],["SmokeShell",2,1],["rhs_VOG25",4,1],["hlc_30Rnd_762x39_b_ak",6,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_mag_rgo",2,1]]],"H_Watchcap_khk","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "veh-gun":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_TShirt_Blue_Black",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_oucamo",[["SmokeShell",4,1],["rhs_VOG25",4,1],["hlc_30Rnd_762x39_b_ak",8,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_mag_rgo",2,1]]],"rhs_beanie_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "ftl":
	{
		_unit setUnitLoadout [["rhs_weap_akmn_gp25","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],["rhs_VOG25",1],""],[],["rhs_weap_tt33","","","",["rhs_mag_762x25_8",8],[],""],["Cre8ive_CU_Uniform_TShirt_Camo_Grey",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["LOP_V_6B23_TAN",[["rhs_VOG25",1,1],["rhs_GRD40_Green",1,1],["rhs_GRD40_Red",1,1]]],["B_Messenger_Gray_F",[["ACRE_PRC152",1],["SmokeShell",2,1],["SmokeShellPurple",1,1],["rhs_mag_762x25_8",2,8],["hlc_30Rnd_762x39_b_ak",5,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_VOG25",4,1]]],"H_Beret_gen_F","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};

	case "rif":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_TShirt_Blue_Blue",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_oucamo",[["SmokeShell",2,1],["rhs_VOG25",4,1],["hlc_30Rnd_762x39_b_ak",6,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_mag_rgo",2,1]]],"H_Bandanna_surfer","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "lat":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],["rhs_weap_rpg26","","","",["rhs_rpg26_mag",1],[],""],[],["Cre8ive_CU_Uniform_TShirt_Tan_Blue",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_oucamo",[["SmokeShell",2,1],["rhs_VOG25",4,1],["hlc_30Rnd_762x39_b_ak",6,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_mag_rgo",2,1]]],"rhs_beanie_green","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "med":
	{
		_unit setUnitLoadout [["rhs_weap_aks74un","rhs_acc_dtk2","","",["rhs_30Rnd_545x39_AK",30],[],""],[],[],["LOP_U_AFR_Civ_01S",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_LegStrapBag_olive_F",[["rhs_30Rnd_545x39_AK",6,30],["rhs_30Rnd_545x39_AK_green",2,30]]],["B_Messenger_Gray_F",[["ACE_bloodIV",7],["ACE_fieldDressing",22],["ACE_morphine",22],["ACE_epinephrine",10],["SmokeShell",4,1]]],"H_Hat_grey","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "mk":
	{
		_unit setUnitLoadout [["rhs_weap_m76","","","rhs_acc_pso1m21",["rhsgref_10Rnd_792x57_m76",10],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["LOP_U_AFR_Civ_03",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_khk",[["ACRE_PRC152",1],["SmokeShell",4,1],["rhs_VOG25",4,1],["rhs_mag_rgo",2,1],["rhsgref_10Rnd_792x57_m76",10,10],["16Rnd_9x21_Mag",6,17]]],"H_Cap_usblack","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "heavy":
	{
		_unit setUnitLoadout [["hlc_rifle_rpk","","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["LOP_U_CHR_Villager_04",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_oucamo",[["SmokeShell",2,1],["rhs_VOG25",4,1],["rhs_mag_rgo",2,1],["hlc_75Rnd_762x39_m_rpk",5,75]]],"LOP_H_Cowboy_hat","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "ar":
	{
		_unit setUnitLoadout [["hlc_rifle_rpk","","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["LOP_U_CHR_Worker_04",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["B_FieldPack_oucamo",[["SmokeShell",2,1],["rhs_VOG25",4,1],["rhs_mag_rgo",2,1],["hlc_75Rnd_762x39_m_rpk",5,75]]],"LOP_H_ChDKZ_Beret","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	case "aar":
	{
		_unit setUnitLoadout [["rhs_weap_akm","rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],["Cre8ive_CU_Uniform_TShirt_White_Blue",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],[],["SOUP_Carryall_M90K",[["ACRE_PRC152",1],["SmokeShell",2,1],["rhs_VOG25",4,1],["hlc_30Rnd_762x39_b_ak",6,30],["hlc_30Rnd_762x39_t_ak",2,30],["rhs_mag_rgo",2,1],["hlc_75Rnd_762x39_m_rpk",5,75]]],"usm_bdu_boonie_dcu","",["Rangefinder","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
	case "zeus":
	{
		_unit setUnitLoadout [["hlc_rifle_FAL5000_RH","","","",["hlc_20Rnd_762x51_B_fal",20],[],""],[],[],["LOP_U_CHR_Priest_01",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",9]]],["V_LegStrapBag_black_F",[]],["B_Messenger_Black_F",[["ACRE_PRC152",1],["hlc_50rnd_762x51_M_FAL",4,20],["rhs_mag_m67",4,1],["SmokeShell",4,1],["SmokeShellOrange",2,1],["SmokeShellPurple",1,1]]],"H_Hat_brown","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];
	};
	
	
// CRATE: Medium, ammo for 1 squad
	case "crate_med":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["rhs_weap_akmn", 5];
		_unit addItemCargoGlobal ["rhs_weap_ak74m_desert", 1];
		_unit addItemCargoGlobal ["rhs_weap_rpg26", 6];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 50];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 50];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];

		_unit addItemCargoGlobal ["hlc_30Rnd_762x39_b_ak", 60];
		_unit addItemCargoGlobal ["hlc_30Rnd_762x39_t_ak", 20];
		_unit addItemCargoGlobal ["hlc_30Rnd_545x39_B_AK", 20];
		_unit addItemCargoGlobal ["rhsgref_10Rnd_792x57_m76", 20];
		_unit addItemCargoGlobal ["hlc_75Rnd_762x39_m_rpk", 20];
		_unit addItemCargoGlobal ["rhs_mag_rgo", 20];
		_unit addItemCargoGlobal ["SmokeShell", 10];
		_unit addItemCargoGlobal ["ACE_SpareBarrel", 1];

		_unit addItemCargoGlobal ["SmokeShellGreen", 2];
		_unit addItemCargoGlobal ["SmokeShellPurple", 2];

		_unit addItemCargoGlobal ["ACRE_PRC343", 10];
		_unit addItemCargoGlobal ["ACRE_PRC152", 2];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
	};
	
	
	case "landie":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addItemCargoGlobal ["rhs_weap_t5000", 5];
		_unit addItemCargoGlobal ["rhs_weap_ak74m_desert", 1];
		_unit addItemCargoGlobal ["rhs_weap_akmn", 4];
		_unit addItemCargoGlobal ["rhs_weap_rpg26", 3];

		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_epinephrine", 5];
		_unit addItemCargoGlobal ["ACE_morphine", 20];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];

		_unit addItemCargoGlobal ["hlc_30Rnd_762x39_b_ak", 30];
		_unit addItemCargoGlobal ["hlc_30Rnd_762x39_t_ak", 10];
		_unit addItemCargoGlobal ["hlc_30Rnd_545x39_B_AK", 10];
		_unit addItemCargoGlobal ["rhsgref_10Rnd_792x57_m76", 5];
		_unit addItemCargoGlobal ["hlc_75Rnd_762x39_m_rpk", 5];
		_unit addItemCargoGlobal ["rhs_5Rnd_338lapua_t5000", 50];
		_unit addItemCargoGlobal ["RKSL_optic_PMII_525", 5];
		_unit addItemCargoGlobal ["bipod_01_F_blk", 5];
		_unit addItemCargoGlobal ["rhs_mag_rgo", 5];
		_unit addItemCargoGlobal ["SmokeShell", 5];
		
		_unit addItemCargoGlobal ["B_Mortar_01_support_F", 1];
		_unit addItemCargoGlobal ["B_Mortar_01_weapon_F", 1];

		_unit addItemCargoGlobal ["ACRE_PRC343", 5];
		_unit addItemCargoGlobal ["ACRE_PRC152", 1];
		
		_unit addItemCargoGlobal ["Toolkit", 1];
	};
	
// CRATE: Large, ammo for 1 platoon
	case "crate_large":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 45];
		_unit addMagazineCargoGlobal [_glriflemag, 60];
		_unit addMagazineCargoGlobal [_armag, 45];
		_unit addMagazineCargoGlobal [_carbinemag, 60];
		_unit addMagazineCargoGlobal [_glmag, 60];
		_unit addMagazineCargoGlobal [_glsmokewhite,50];
		_unit addMagazineCargoGlobal [_ratmag, 20];
		_unit addMagazineCargoGlobal [_grenade, 75];
		_unit addMagazineCargoGlobal [_mgrenade, 75];
		_unit addMagazineCargoGlobal [_smokegrenade, 75];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 20];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 150];
		_unit addItemCargoGlobal ["ACE_morphine", 75];
		_unit addItemCargoGlobal ["ACE_epinephrine", 50];
		_unit addItemCargoGlobal ["ACE_bloodIV", 25];

};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
		_unit addmagazines [_riflemag,7];
		_unit addweapon _rifle;

		_unit selectweapon primaryweapon _unit;

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
