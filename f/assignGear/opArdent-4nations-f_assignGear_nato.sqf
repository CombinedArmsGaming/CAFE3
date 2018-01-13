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

// LOADOUT: COMMANDER
	case "ger-aar":
	{
		_unit setUnitLoadout [["hlc_rifle_G36CTac","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_T1_low",["hlc_30rnd_556x45_MDIM_G36",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["Cre8ive_Bw_Uniform_W_1",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["Cre8ive_Bw_Vest_W_1",[["rhs_mag_m67",5,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17],["hlc_30rnd_556x45_MDIM_G36",3,30],["hlc_30rnd_556x45_TDIM_G36",5,30]]],["Cre8ive_Bw_Kitbag_W",[["ACE_CableTie",2],["hlc_30rnd_556x45_TDIM_G36",5,30],["hlc_100rnd_556x45_Mdim_G36",1,100],["hlc_100rnd_556x45_M_G36",1,100],["hlc_100rnd_556x45_EPR_G36",2,100]]],"Cre8ive_Bw_Helmet_W","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "ger-ar":
	{
		_unit setUnitLoadout [["hlc_rifle_G36V_CMAG","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_T1_low",["hlc_100rnd_556x45_EPR_G36",100],[],"rhsusf_acc_harris_bipod"],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["Cre8ive_Bw_Uniform_W_1",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["Cre8ive_Bw_Vest_W_1",[["rhsusf_mag_17Rnd_9x19_JHP",2,17],["rhs_mag_m67",3,1],["SmokeShell",2,1],["hlc_100rnd_556x45_Mdim_G36",2,100]]],["Cre8ive_Bw_Kitbag_W",[["ACE_CableTie",2],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["hlc_100rnd_556x45_EPR_G36",3,100]]],"Cre8ive_Bw_Helmet_W","rhs_googles_orange",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "ger-ftl":
	{
		_unit setUnitLoadout [["HLC_Rifle_G36KSKAG36","","rhsusf_acc_anpeq15A","rhsusf_acc_T1_low",["hlc_30rnd_556x45_EPR_G36",30],["1Rnd_HE_Grenade_shell",1],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["Cre8ive_Bw_Uniform_W_1",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC152",1]]],["Cre8ive_Bw_Vest_W_1",[["rhs_mag_m67",5,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17],["hlc_30rnd_556x45_MDIM_G36",3,30],["hlc_30rnd_556x45_TDIM_G36",5,30]]],["Cre8ive_Bw_Assault_W",[["ACE_CableTie",2],["1Rnd_HE_Grenade_shell",10,1],["hlc_30rnd_556x45_TDIM_G36",5,30],["1Rnd_Smoke_Grenade_shell",5,1],["UGL_FlareGreen_F",2,1],["UGL_FlareWhite_F",5,1],["1Rnd_SmokeGreen_Grenade_shell",2,1],["1Rnd_SmokePurple_Grenade_shell",2,1],["UGL_FlareCIR_F",2,1]]],"Cre8ive_Bw_Helmet_W","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "ger-med":
	{
		_unit setUnitLoadout [["hlc_rifle_G36KA1KSK","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_T1_low",["hlc_30rnd_556x45_MDIM_G36",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["Cre8ive_Bw_Uniform_W_1",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["Cre8ive_Bw_Vest_W_1",[["rhs_mag_m67",5,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17],["hlc_30rnd_556x45_MDIM_G36",3,30],["hlc_30rnd_556x45_TDIM_G36",5,30]]],["Cre8ive_Bw_Assault_W",[["ACE_CableTie",2],["ACE_bloodIV",7],["ACE_fieldDressing",20],["ACE_epinephrine",10],["ACE_morphine",18],["hlc_30rnd_556x45_TDIM_G36",5,30]]],"Cre8ive_Bw_Helmet_W","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "ger-rif":
	{
		_unit setUnitLoadout [["hlc_rifle_G36KA1KSK","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","rhsusf_acc_T1_low",["hlc_30rnd_556x45_MDIM_G36",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],["Cre8ive_Bw_Uniform_W_1",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["Cre8ive_Bw_Vest_W_1",[["rhs_mag_m67",5,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["rhsusf_mag_17Rnd_9x19_JHP",2,17],["hlc_30rnd_556x45_MDIM_G36",3,30],["hlc_30rnd_556x45_TDIM_G36",5,30]]],["Cre8ive_Bw_Assault_W",[["ACE_CableTie",2],["hlc_30rnd_556x45_TDIM_G36",5,30]]],"Cre8ive_Bw_Helmet_W","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	
	
	
	
	case "chi-aar":
	{
		_unit setUnitLoadout [["arifle_CTAR_blk_F","muzzle_snds_58_blk_F","rhsusf_acc_anpeq15A","optic_ACO_grn",["30Rnd_580x42_Mag_F",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhsgref_uniform_ttsko_urban",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["V_PlateCarrier1_blk",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["16Rnd_9x21_Mag",2,17],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30]]],["B_TacticalPack_blk",[["ACE_CableTie",2],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30],["100Rnd_580x42_Mag_F",3,100],["100Rnd_580x42_Mag_Tracer_F",2,100]]],"rhsgref_6b27m_ttsko_urban","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "chi-ar":
	{
		_unit setUnitLoadout [["arifle_CTARS_blk_F","muzzle_snds_58_blk_F","rhsusf_acc_anpeq15A","optic_ACO_grn",["100Rnd_580x42_Mag_F",100],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhsgref_uniform_ttsko_urban",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["V_PlateCarrier1_blk",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["16Rnd_9x21_Mag",2,17],["100Rnd_580x42_Mag_F",3,100]]],["B_TacticalPack_blk",[["ACE_CableTie",2],["100Rnd_580x42_Mag_F",3,100],["100Rnd_580x42_Mag_Tracer_F",2,100],["16Rnd_9x21_Mag",2,17]]],"rhsgref_6b27m_ttsko_urban","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "chi-ftl":
	{
		_unit setUnitLoadout [["arifle_CTAR_GL_blk_F","muzzle_snds_58_blk_F","rhsusf_acc_anpeq15A","optic_ACO_grn",["30Rnd_580x42_Mag_F",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhsgref_uniform_ttsko_urban",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1],["ACRE_PRC152",1]]],["V_PlateCarrier1_blk",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",4,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["16Rnd_9x21_Mag",2,17],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30],["1Rnd_HE_Grenade_shell",5,1]]],["B_TacticalPack_blk",[["ACE_CableTie",2],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",2,30],["1Rnd_HE_Grenade_shell",9,1],["UGL_FlareWhite_F",2,1],["1Rnd_Smoke_Grenade_shell",2,1],["UGL_FlareYellow_F",2,1]]],"rhsgref_6b27m_ttsko_urban","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "chi-med":
	{
		_unit setUnitLoadout [["arifle_CTAR_blk_F","muzzle_snds_58_blk_F","rhsusf_acc_anpeq15A","optic_ACO_grn",["30Rnd_580x42_Mag_F",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhsgref_uniform_ttsko_urban",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["V_PlateCarrier1_blk",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["16Rnd_9x21_Mag",2,17],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30]]],["B_TacticalPack_blk",[["ACE_CableTie",2],["ACE_fieldDressing",20],["ACE_bloodIV",10],["ACE_epinephrine",10],["ACE_morphine",20],["30Rnd_580x42_Mag_F",3,30],["30Rnd_580x42_Mag_Tracer_F",2,30]]],"rhsgref_6b27m_ttsko_urban","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "chi-rif":
	{
		_unit setUnitLoadout [["arifle_CTAR_blk_F","muzzle_snds_58_blk_F","rhsusf_acc_anpeq15A","optic_ACO_grn",["30Rnd_580x42_Mag_F",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhsgref_uniform_ttsko_urban",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["V_PlateCarrier1_blk",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["16Rnd_9x21_Mag",2,17],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30]]],["B_TacticalPack_blk",[["ACE_CableTie",2],["30Rnd_580x42_Mag_F",5,30],["30Rnd_580x42_Mag_Tracer_F",3,30]]],"rhsgref_6b27m_ttsko_urban","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	
	
	
	
	case "uk-aar":
	{
		_unit setUnitLoadout [["UK3CB_BAF_L128A1","","rhsusf_acc_anpeq15A","RKSL_optic_RMR_MS19",["UK3CB_BAF_12G_Pellets",8],[],""],[],["UK3CB_BAF_L131A1","hlc_muzzle_TiRant9","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_raf_uniform_kr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["mpx_virtus_admin",[["rhs_mag_m67",4,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["UK3CB_BAF_12G_Pellets",11,8],["UK3CB_BAF_12G_Slugs",4,8]]],["mpx_daysack8",[["ACE_CableTie",2],["UK3CB_BAF_9_17Rnd",2,17],["rhs_200rnd_556x45_B_SAW",3,200],["rhs_200rnd_556x45_T_SAW",1,200],["UK3CB_BAF_12G_Pellets",4,8]]],"mpx_cobra_catseyes","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "uk-ar":
	{
		_unit setUnitLoadout [["rhs_weap_m249_pip_S","rhsusf_acc_nt4_black","rhsusf_acc_anpeq15A","RKSL_optic_LDS",["rhs_200rnd_556x45_M_SAW",200],[],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_raf_uniform_kr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["rhs_mag_m67",2,1]]],["mpx_virtus_admin",[["rhs_mag_m67",4,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["rhs_200rnd_556x45_B_SAW",1,200],["UK3CB_BAF_9_17Rnd",2,17]]],["mpx_daysack8",[["ACE_CableTie",2],["rhs_200rnd_556x45_T_SAW",1,200],["rhs_200rnd_556x45_B_SAW",1,200]]],"mpx_cobra_catseyes","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "uk-ftl":
	{
		_unit setUnitLoadout [["UK3CB_BAF_L85A2_UGL","UK3CB_BAF_SFFH","rhsusf_acc_anpeq15A","FHQ_optic_MicroCCO_low",["UK3CB_BAF_556_30Rnd",30],["UK3CB_BAF_1Rnd_HE_Grenade_Shell",1],""],[],["UK3CB_BAF_L131A1","hlc_muzzle_TiRant9","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_raf_uniform_kr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1],["ACRE_PRC152",1]]],["mpx_virtus_admin",[["rhs_mag_m67",5,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["UK3CB_BAF_9_17Rnd",6,17],["UK3CB_BAF_556_30Rnd_T",1,30]]],["mpx_daysack8",[["ACE_CableTie",2],["UK3CB_BAF_556_30Rnd_T",2,30],["UK3CB_BAF_556_30Rnd",6,30],["UK3CB_BAF_1Rnd_HE_Grenade_Shell",9,1],["UK3CB_BAF_UGL_FlareWhite_F",2,1],["UK3CB_BAF_1Rnd_SmokePurple_Grenade_shell",2,1],["UK3CB_BAF_1Rnd_SmokeGreen_Grenade_shell",2,1],["UK3CB_BAF_1Rnd_Smoke_Grenade_shell",2,1]]],"mpx_cobra_catseyes","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "uk-med":
	{
		_unit setUnitLoadout [["UK3CB_BAF_L85A2_RIS_AFG","UK3CB_BAF_Silencer_L85","rhsusf_acc_anpeq15A","FHQ_optic_MicroCCO_low",["UK3CB_BAF_556_30Rnd",30],[],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_raf_uniform_kr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["mpx_virtus_Medic",[["rhs_mag_m67",6,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["UK3CB_BAF_556_30Rnd",5,30],["UK3CB_BAF_556_30Rnd_T",2,30]]],["mpx_daysack7",[["ACE_CableTie",2],["ACE_bloodIV",7],["ACE_fieldDressing",20],["ACE_morphine",20],["ACE_epinephrine",10],["UK3CB_BAF_556_30Rnd",5,30],["UK3CB_BAF_556_30Rnd_T",2,30]]],"mpx_cobra_catseyes","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "uk-rif":
	{
		_unit setUnitLoadout [["UK3CB_BAF_L85A2_RIS_AFG","UK3CB_BAF_Silencer_L85","rhsusf_acc_anpeq15A","FHQ_optic_MicroCCO_low",["UK3CB_BAF_556_30Rnd",30],[],""],[],["UK3CB_BAF_L131A1","","UK3CB_BAF_Flashlight_L131A1","",["UK3CB_BAF_9_17Rnd",17],[],""],["mpx_mtp_raf_uniform_kr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_Flashlight_XL50",1],["ACE_bloodIV",1]]],["mpx_virtus_admin",[["rhs_mag_m67",6,1],["Chemlight_blue",2,1],["B_IR_Grenade",1,1],["UK3CB_BAF_556_30Rnd",5,30],["UK3CB_BAF_556_30Rnd_T",2,30]]],["mpx_daysack8",[["ACE_CableTie",2],["UK3CB_BAF_556_30Rnd",5,30],["UK3CB_BAF_556_30Rnd_T",2,30]]],"mpx_cobra_catseyes","",["ACE_Vector","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	
	
	
	
	case "rus-aar":
	{
		_unit setUnitLoadout [["hlc_rifle_saiga12k","","","rhs_acc_pkas",["hlc_10rnd_12g_buck_S12",10],[],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_vdv_emr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1]]],["rhs_6sh92_digi_headset",[["rhs_mag_rgo",3,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["rhs_mag_9x19_17",2,17],["hlc_10rnd_12g_buck_S12",4,10]]],["B_Carryall_oli",[["ACE_CableTie",2],["hlc_10rnd_12g_buck_S12",6,10],["hlc_10rnd_12g_slug_S12",4,10],["rhs_100Rnd_762x54mmR_7N26",2,100],["rhs_100Rnd_762x54mmR_green",1,100]]],"rhs_6b27m_digi","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "rus-ar":
	{
		_unit setUnitLoadout [["rhs_weap_pkp","","","rhs_acc_pkas",["rhs_100Rnd_762x54mmR_7N26",100],[],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_vdv_emr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["rhs_6sh92_digi_headset",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["rhs_mag_9x19_17",5,17]]],["rhs_assault_umbts",[["ACE_CableTie",2],["rhs_100Rnd_762x54mmR_7N26",1,100],["rhs_100Rnd_762x54mmR_green",1,100]]],"rhs_6b27m_digi","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "rus-ftl":
	{
		_unit setUnitLoadout [["rhs_weap_ak74mr_gp25","rhs_acc_tgpa","","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK",30],["rhs_VOG25",1],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_vdv_emr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1],["ACRE_PRC152",1]]],["rhs_6sh92_digi_headset",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",4,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["rhs_30Rnd_545x39_7N22_AK",4,30],["rhs_VOG25",5,1]]],["rhs_assault_umbts",[["ACE_CableTie",2],["rhs_mag_9x19_17",3,17],["rhs_30Rnd_545x39_7N22_AK",4,30],["rhs_30Rnd_545x39_AK_green",4,30],["rhs_VOG25",6,1],["hlc_GRD_White",2,1],["rhs_VG40MD_White",2,1]]],"rhs_6b27m_digi","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "rus-med":
	{
		_unit setUnitLoadout [["rhs_weap_ak105_zenitco01_b33","rhs_acc_tgpa","rhs_acc_perst1ik_ris","rhs_acc_1p87",["rhs_30Rnd_545x39_AK",30],[],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_vdv_emr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1]]],["rhs_6sh92_digi_headset",[["rhs_mag_rgo",3,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["rhs_30Rnd_545x39_7N22_AK",7,30]]],["B_FieldPack_oli",[["ACE_CableTie",2],["ACE_fieldDressing",20],["ACE_epinephrine",10],["ACE_morphine",20],["ACE_bloodIV",10],["rhs_mag_9x19_17",2,17],["rhs_30Rnd_545x39_7N22_AK",2,30],["rhs_30Rnd_545x39_AK_green",1,30]]],"rhs_6b27m_digi","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	case "rus-rif":
	{
		_unit setUnitLoadout [["rhs_weap_ak74m_zenitco01_b33","rhs_acc_tgpa","rhs_acc_perst1ik_ris","rhs_acc_1p87",["rhs_30Rnd_545x39_7N10_AK",30],[],"rhs_acc_grip_ffg2"],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_vdv_emr",[["ACE_fieldDressing",6],["ACE_morphine",6],["ACRE_PRC343",1],["ACE_bloodIV",1],["ACE_MapTools",1]]],["rhs_6sh92_digi_headset",[["ACE_Flashlight_XL50",1],["rhs_mag_rgo",6,1],["O_IR_Grenade",1,1],["ACE_Chemlight_Orange",2,1],["rhs_30Rnd_545x39_7N22_AK",4,30]]],["rhs_assault_umbts",[["ACE_CableTie",2],["rhs_30Rnd_545x39_7N22_AK",6,30],["rhs_30Rnd_545x39_AK_green",5,30],["rhs_mag_9x19_17",3,17]]],"rhs_6b27m_digi","",["ACE_Yardage450","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","rhsusf_ANPVS_15"]];
	};
	
	
	
	
	
	case "nk-rif":
	{
		_unit setUnitLoadout [["hlc_rifle_ak47","","","",["hlc_30Rnd_762x39_b_ak",30],[],""],[],[],["rhs_uniform_m88_patchless",[["ACE_fieldDressing",3],["ACE_morphine",2],["ACE_Banana",1],["SmokeShell",1,1]]],["UK3CB_BAF_V_PLCE_Webbing_Plate_OLI",[["rhs_30Rnd_762x39mm",6,30],["rhs_mag_rgo",2,1]]],[],"UNS_M1_1A","",["Binocular","","","",[],[],""],["ItemMap","","","","ItemWatch",""]];
	};
	
	case "nk-ar":
	{
		_unit setUnitLoadout [["hlc_rifle_rpk_75rnd","","","",["hlc_75Rnd_762x39_m_rpk",75],[],""],[],[],["rhs_uniform_m88_patchless",[["ACE_fieldDressing",3],["ACE_morphine",2],["SmokeShell",1,1]]],["UK3CB_BAF_V_PLCE_Webbing_Plate_OLI",[["rhs_mag_rgo",2,1],["hlc_75Rnd_762x39_m_rpk",3,75]]],[],"UNS_M1_1A","",["Binocular","","","",[],[],""],["ItemMap","","","","ItemWatch",""]];
	};
	
	
	
	case "zeus":
	{
		_unit setUnitLoadout [["LMG_Mk200_F","","acc_pointer_IR","optic_Hamr",["200Rnd_65x39_cased_Box_Tracer",200],[],"rhs_acc_harris_swivel"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam_tshirt",[["ACE_fieldDressing",10],["ACE_bloodIV_250",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACRE_PRC343",1]]],["V_PlateCarrier2_rgr",[["ACRE_PRC152",1],["ACRE_PRC343",1],["16Rnd_9x21_Mag",3,17],["200Rnd_65x39_cased_Box",1,200],["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1]]],["B_AssaultPack_rgr",[["200Rnd_65x39_cased_Box",2,200],["200Rnd_65x39_cased_Box_Tracer",1,200]]],"H_HelmetB_grass","",[],["ItemMap","","","ItemCompass","ItemWatch","O_NVGoggles_hex_F"]];
	};
	
	
	
	
	
	case "crate_med":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		
		_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N22_AK", 60];
		_unit addMagazineCargoGlobal ["rhs_mag_9x19_17", 20];
		_unit addMagazineCargoGlobal ["rhs_mag_rgo", 10];
		_unit addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR_7N26", 10];
		_unit addMagazineCargoGlobal ["hlc_10rnd_12g_buck_S12", 20];
		_unit addMagazineCargoGlobal ["hlc_10rnd_12g_slug_S12", 10];
		_unit addMagazineCargoGlobal ["rhs_VOG25", 10];
		_unit addMagazineCargoGlobal ["hlc_GRD_White", 5];
		
		_unit addMagazineCargoGlobal ["UK3CB_BAF_12G_Pellets", 20];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_9_17Rnd", 20];
		_unit addMagazineCargoGlobal ["rhs_mag_m67", 10];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_12G_Slugs", 10];
		_unit addMagazineCargoGlobal ["rhs_200rnd_556x45_B_SAW", 10];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd", 40];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_556_30Rnd_T", 20];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", 10];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_UGL_FlareWhite_F", 5];
		
		_unit addMagazineCargoGlobal ["16Rnd_9x21_Mag", 20];
		_unit addMagazineCargoGlobal ["100Rnd_580x42_Mag_F", 10];
		_unit addMagazineCargoGlobal ["30Rnd_580x42_Mag_F", 40];
		_unit addMagazineCargoGlobal ["30Rnd_580x42_Mag_Tracer_F", 20];
		_unit addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_unit addMagazineCargoGlobal ["UGL_FlareWhite_F", 5];
		
		_unit addMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP", 20];
		_unit addMagazineCargoGlobal ["hlc_100rnd_556x45_EPR_G36", 10];
		_unit addMagazineCargoGlobal ["hlc_30rnd_556x45_MDIM_G36", 40];
		_unit addMagazineCargoGlobal ["hlc_30rnd_556x45_TDIM_G36", 20];
		_unit addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 10];
		_unit addMagazineCargoGlobal ["UGL_FlareWhite_F", 5];
		
		_unit addMagazineCargoGlobal ["rhs_30Rnd_762x39mm", 20];
		
		_unit addItemCargoGlobal ["ACE_fieldDressing", 60];
		_unit addItemCargoGlobal ["ACE_morphine", 60];
		_unit addItemCargoGlobal ["ACE_epinephrine", 30];
		_unit addItemCargoGlobal ["ACE_bloodIV", 20];
		_unit addItemCargoGlobal ["ACRE_PRC343", 24];
		_unit addItemCargoGlobal ["ACRE_PRC152", 4];
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
