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
	case "co":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_PESH_Fatigue_01_slv";
		_unit addItemToUniform "FirstAidKit";
		_unit addItemToUniform "ACRE_PRC152";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_Banana";
		_unit addVest "VSM_CarrierRig_Operator_M81";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 6 do {_unit addItemToVest "hlc_30Rnd_762x39_b_ak";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_30Rnd_762x39_t_ak";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";};
		_unit addItemToVest "Chemlight_green";
		_unit addItemToVest "ACE_Chemlight_IR";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addHeadgear "rhs_8point_marpatwd";

		_unit addWeapon "rhs_weap_akm";
		_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
		_unit addPrimaryWeaponItem "rhs_acc_perst1ik";
		_unit addWeapon "rhsusf_weap_m9";
		_unit addWeapon "Binocular";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		
	};

// LOADOUT: DEPUTY COMMANDER AND SQUAD LEADER

	case "tac-at":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_Polo_Grey";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addVest "rhsusf_mbav_medic";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
		for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30rnd_556x45_MDim";};
		for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_SmokeShell";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		_unit addHeadgear "H_Bandanna_gry";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "rhs_weap_m4a1_blockII_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_SFMB556";
		_unit addPrimaryWeaponItem "sma_spitfire_03_rds_low_ard_black";
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "tac-med":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_TShirt_Tan_Grey";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 12 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addVest "rhsusf_mbav_medic";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 9 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
		for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30rnd_556x45_MDim";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_SmokeShell";};
		_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
		for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_morphine";};
		_unit addHeadgear "H_Cap_red";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "rhs_weap_m4a1_blockII_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_SFMB556";
		_unit addPrimaryWeaponItem "sma_spitfire_03_rds_low_ard_black";
		_unit addWeapon "hgun_P07_F";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "tac-sl":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_TShirt_Tan_Grey";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_bloodIV_250";
		_unit addVest "rhsusf_mbav_grenadier";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 11 do {_unit addItemToVest "hlc_30rnd_556x45_EPR";};
		for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30rnd_556x45_MDim";};
		_unit addItemToVest "Laserbatteries";
		_unit addBackpack "rhsusf_falconii_mc";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "16Rnd_9x21_Mag";};
		_unit addItemToBackpack "Laserbatteries";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "rhs_mag_M441_HE";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m662_red";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeGreen_Grenade_shell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
		_unit addHeadgear "H_Bandanna_khk_hs";
		_unit addGoggles "rhs_googles_black";

		_unit addWeapon "rhs_weap_m4a1_blockII_M203_d";
		_unit addPrimaryWeaponItem "rhsusf_acc_SFMB556";
		_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Black";
		_unit addPrimaryWeaponItem "sma_spitfire_03_rds_low_ard_black";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "hlc_muzzle_Evo9";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "tac-ar":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_TShirt_Tan_Blue";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_bloodIV_250";
		_unit addVest "rhsusf_mbav_mg";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		_unit addItemToVest "rhs_200rnd_556x45_M_SAW";
		_unit addItemToVest "rhs_200rnd_556x45_T_SAW";
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "rhs_200rnd_556x45_B_SAW";
		_unit addBackpack "usm_pack_200rnd_556_bandoliers";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "16Rnd_9x21_Mag";};
		_unit addHeadgear "H_Watchcap_khk";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "rhs_weap_m249_pip";
		_unit addPrimaryWeaponItem "rhsusf_acc_SFMB556";
		this addPrimaryWeaponItem "sma_spitfire_03_rds_low_ard_black";
		_unit addWeapon "hgun_P07_F";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "tac-sn":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_Polo_Khaki";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_bloodIV_250";
		_unit addVest "rhsusf_mbav_light";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 6 do {_unit addItemToVest "7Rnd_408_Mag";};
		_unit addBackpack "B_FieldPack_cbr";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "7Rnd_408_Mag";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_7Rnd_408_305gr_Mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "UK3CB_BAF_SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "UK3CB_BAF_SmokeShellBlue";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_blue";};
		_unit addHeadgear "SOUP_Boonie_CAN_ARID";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "srifle_LRR_camo_F";
		_unit addPrimaryWeaponItem "RKSL_optic_PMII_312_sunshade_des";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "hlc_muzzle_Evo9";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "tac-mk":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "Cre8ive_CU_Uniform_Polo_Khaki";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACE_bloodIV_250";
		_unit addVest "rhsusf_mbav_light";
		for "_i" from 1 to 12 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addBackpack "B_FieldPack_cbr";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m62_Mag";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_20Rnd_762x51_m993_Mag";};
		_unit addItemToBackpack "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "UK3CB_BAF_SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "UK3CB_BAF_SmokeShellRed";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Chemlight_green";};
		_unit addHeadgear "SOUP_Boonie_CAN_ARID";
		_unit addGoggles "rhs_googles_orange";

		_unit addWeapon "rhs_weap_m14ebrri";
		_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Black";
		_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
		_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "hlc_muzzle_Evo9";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};

	case "dc":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,2];
		_unit addmagazines [_glmag,3];
		_unit addmagazines [_glsmokewhite,4];
		_unit addweapon _glrifle;					//_DCrifle
		_unit addmagazines [_pistolmag,2];
		_unit addweapon _pistol;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_smokegrenadegreen,2];
		_unit addWeapon "Rangefinder";
		_unit linkItem "ItemGPS";
		_unit addItem "ACE_microDAGR";
		["g"] call _backpack;
	};

// LOADOUT: MEDIC
	case "m":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_IA_Fatigue_02";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_epinephrine";};
		_unit addVest "rhs_6b23_medic";
		for "_i" from 1 to 10 do {_unit addItemToVest "ACE_epinephrine";};
		for "_i" from 1 to 24 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 24 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
		_unit addItemToVest "SmokeShellPurple";
		_unit addBackpack "rhs_medic_bag";
		for "_i" from 1 to 9 do {_unit addItemToBackpack "ACE_bloodIV";};
		_unit addItemToBackpack "ACE_bloodIV_500";
		_unit addHeadgear "rhs_6b27m_green_ess";

		_unit addWeapon "hlc_rifle_aks74u";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};

// LOADOUT: FIRE TEAM LEADER
	case "ftl":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_PESH_Fatigue_01_slv";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "LOP_V_6B23_Rifleman_M81";
		_unit addItemToVest "SmokeShellGreen";
		for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_m67";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_30Rnd_762x39_b_ak";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "hlc_30Rnd_762x39_b_ak";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "hlc_30Rnd_762x39_t_ak";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_f1";};
		_unit addHeadgear "rhs_6b28_green_ess";

		_unit addWeapon "rhs_weap_akmn";
		_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
		_unit addWeapon "Binocular";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};
	
	case "mat":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_IA_Fatigue_03";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "V_BandollierB_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "rhs_mag_rgo";
		for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
		_unit addBackpack "rhs_rpg_empty";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};

		_unit addWeapon "hlc_rifle_aks74u";
		_unit addWeapon "rhs_weap_rpg7";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
	};
	
	
	case "mk":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_PESH_Fatigue_03_slv";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_9x18_8_57N181S";};
		_unit addVest "V_BandollierB_rgr";
		for "_i" from 1 to 9 do {_unit addItemToVest "rhsgref_10Rnd_792x57_m76";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		_unit addItemToVest "rhs_mag_m67";
		_unit addItemToVest "rhs_acc_pso1m21";

		_unit addWeapon "rhs_weap_m76";
		_unit addPrimaryWeaponItem "rhs_acc_pso1m21";
		_unit addWeapon "rhs_weap_makarov_pm";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		
	};


// LOADOUT: AUTOMATIC RIFLEMAN
	case "ar":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_AA_Fatigue_02_slv";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "hlc_45Rnd_762x39_AP_rpk";
		_unit addVest "V_BandollierB_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "rhs_mag_rgo";
		for "_i" from 1 to 3 do {_unit addItemToVest "hlc_45Rnd_762x39_m_rpk";};
		_unit addItemToVest "hlc_45Rnd_762x39_t_rpk";
		_unit addBackpack "rhs_sidor";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_75Rnd_762x39_m_rpk";};

		_unit addWeapon "hlc_rifle_rpk";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

	};
	
// LOADOUT: LIGHT MACHINEGUNNER
	case "lmg":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_IA_Fatigue_03";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "V_BandollierB_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "rhs_mag_rgo";
		_unit addItemToVest "rhs_100Rnd_762x54mmR_green";
		_unit addBackpack "rhs_sidor";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};

		_unit addWeapon "rhs_weap_pkm";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};

// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
	case "aar":
	{
		_unit addmagazines [_riflemag,7];
		_unit addmagazines [_riflemag_tr,2];
		_unit addweapon _rifle;
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_mgrenade,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addWeapon "Binocular";
		["aar"] call _backpack;
	};

// LOADOUT: RIFLEMAN (AT)
	case "rat":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
		["rat"] call _backpack;
		(unitBackpack _unit) addMagazineCargoGlobal [_RATmag,1];
		_unit addweapon _RAT;
	};
	
	case "sl":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_PESH_Fatigue_01_slv";
		_unit addItemToUniform "FirstAidKit";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "LOP_V_6B23_Rifleman_M81";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_VOG25";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_VG40OP_green";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_VG40OP_red";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_762x25_8";};
		_unit addBackpack "SOUP_Assault_Pack_M81";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "hlc_30Rnd_545x39_B_AK";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "hlc_30Rnd_545x39_t_ak";};
		_unit addHeadgear "rhs_6b27m_green";

		_unit addWeapon "rhs_weap_aks74_gp25";
		_unit addPrimaryWeaponItem "rhs_acc_dtk1983";
		_unit addWeapon "rhs_weap_tt33";
		_unit addWeapon "Binocular";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	};

// LOADOUT: DESIGNATED MARKSMAN
	case "dm":
	{
		_unit addmagazines [_DMriflemag,7];
		_unit addweapon _DMrifle;
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_mgrenade,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_pistolmag,3];
		_unit addweapon _pistol;
		["dm"] call _backpack;
		_attachments = [_attach1,_scope2];
	};

// LOADOUT: MEDIUM MG GUNNER
	case "mmgg":
	{
		_unit addmagazines [_MMGmag,1];
		_unit addweapon _MMG;
		_unit addmagazines [_MMGmag,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_pistolmag,4];
		_unit addweapon _pistol;
		["mmg"] call _backpack;
		_attachments pushback (_bipod1);
	};

// LOADOUT: MEDIUM MG ASSISTANT GUNNER
	case "mmgag":
	{
		_unit addmagazines [_riflemag,7];
		_unit addmagazines [_riflemag_tr,2];
		_unit addweapon _rifle;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade,2];
		_unit addmagazines [_mgrenade,2];
		_unit addmagazines [_smokegrenade,2];
		["mmgag"] call _backpack;
	};

// LOADOUT: HEAVY MG GUNNER
	case "hmgg":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["hmgg"] call _backpack;
	};

// LOADOUT: HEAVY MG ASSISTANT GUNNER
	case "hmgag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["hmgag"] call _backpack;
	};

// LOADOUT: MEDIUM AT GUNNER
	case "matg":
	{
		["matg"] call _backpack;
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addmagazines [_smokegrenade,2];
		_unit addweapon _carbine;
		_unit addweapon _MAT;
	};

// LOADOUT: MEDIUM AT ASSISTANT GUNNER
	case "matag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addWeapon "Rangefinder";;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,2];
		["matag"] call _backpack;
	};

// LOADOUT: HEAVY AT GUNNER
	case "hatg":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addweapon _carbine;
		["hatg"] call _backpack;
		_unit addWeapon _HAT;
	};

// LOADOUT: HEAVY AT ASSISTANT GUNNER
	case "hatag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["hatag"] call _backpack;
	};

// LOADOUT: MORTAR GUNNER
	case "mtrg":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["mtrg"] call _backpack;
	};

// LOADOUT: MORTAR ASSISTANT GUNNER
	case "mtrag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		_unit addWeapon "Rangefinder";
		["mtrag"] call _backpack;
	};

// LOADOUT: MEDIUM SAM GUNNER
	case "msamg":
	{
		["msamg"] call _backpack;
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,1];
		_unit addmagazines [_grenade,1];
		_unit addweapon _SAM;
	};

// LOADOUT: MEDIUM SAM ASSISTANT GUNNER
	case "msamag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenade,1];
		["msamag"] call _backpack;
	};

// LOADOUT: HEAVY SAM GUNNER
	case "hsamg":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["hsamg"] call _backpack;
	};

// LOADOUT: HEAVY SAM ASSISTANT GUNNER
	case "hsamag":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addWeapon "Rangefinder";
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_smokegrenade,1];
		["hsamag"] call _backpack;
	};

// LOADOUT: SNIPER
	case "sn":
	{
		_unit addmagazines [_SNrifleMag,9];
		_unit addweapon _SNrifle;
		_unit addmagazines [_pistolmag,4];
		_unit addweapon _pistol;
		_unit addmagazines [_smokegrenade,2];
		_attachments = [_scope3];
		_unit addItem "ACE_Kestrel4500";
		["none"] call _backpack;
	};

// LOADOUT: SPOTTER
	case "sp":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,2];
		_unit addmagazines [_glmag,3];
		_unit addmagazines [_glsmokewhite,4];
		_unit addweapon _glrifle;					//_COrifle
		_unit addmagazines [_smokegrenade,2];
		_unit addWeapon "Rangefinder";
		_unit linkItem "ItemGPS";
		_unit addItem "ACE_microDAGR";
		["none"] call _backpack;
	};

// LOADOUT: VEHICLE COMMANDER
	case "vc":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		_unit addWeapon "Rangefinder";
		["none"] call _backpack;
	};

// LOADOUT: VEHICLE DRIVER
	case "vd":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["cc"] call _backpack;
	};

// LOADOUT: VEHICLE GUNNER
	case "vg":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["none"] call _backpack;
	};

// LOADOUT: AIR VEHICLE PILOTS
	case "pp":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		_unit addItem "ItemGPS";
		_unit assignItem "ItemGPS";
		["none"] call _backpack;
	};

// LOADOUT: AIR VEHICLE CREW CHIEF
	case "pcc":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		["cc"] call _backpack;
	};

// LOADOUT: AIR VEHICLE CREW
	case "pc":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		["none"] call _backpack;
	};

// LOADOUT: ENGINEER (DEMO)
	case "eng":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_satchel,2];
		_unit addItem "MineDetector";
		_unit addItem "ACE_M26_Clacker";
		_unit addItem "ACE_DefusalKit";
		_unit addItem "ACE_wirecutter";
		["eng"] call _backpack;
	};

// LOADOUT: ENGINEER (MINES)
	case "engm":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addweapon _carbine;
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit addmagazines [_APmine2,2];
		_unit addItem "MineDetector";
		_unit addItem "ACE_M26_Clacker";
		_unit addItem "ACE_DefusalKit";
		_unit addItem "ACE_wirecutter";
		["engm"] call _backpack;
	};

// LOADOUT: UAV OPERATOR
	case "uav":
	{
		_unit addmagazines [_smgmag,5];
		_unit addweapon _smg;
		_unit addmagazines [_smokegrenade,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_mgrenade,1];
		_unit linkItem _uavterminal;
		["uav"] call _backpack;
		_unit addMagazines ["Laserbatteries",4];	// Batteries added for the F3 UAV Recharging component
	};

// LOADOUT: Diver
	case "div":
	{
		_unit addmagazines [_diverMag1,4];
		_unit addmagazines [_diverMag2,3];
		_unit addweapon _diverWep;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_mgrenade,3];
		_unit addmagazines [_smokegrenade,3];
		_attachments = [_attach1,_scope1,_silencer1];
		["div"] call _backpack;
	};

// LOADOUT: RIFLEMAN
	case "r":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_AA_Fatigue_02_slv";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "V_BandollierB_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_762x39_b_ak";};
		_unit addItemToVest "rhs_mag_rgo";
		_unit addBackpack "B_TacticalPack_blk";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "hlc_30Rnd_762x39_b_ak";};
		_unit addItemToBackpack "hlc_30Rnd_762x39_t_ak";

		_unit addWeapon "rhs_weap_akmn";
		_unit addPrimaryWeaponItem "rhs_acc_dtkakm";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
// LOADOUT: LIGHT ANTITANK
	case "lat":
	{

		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_AA_Fatigue_02_slv";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "hlc_30Rnd_762x39_b_ak";
		_unit addVest "V_BandollierB_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_762x39_b_ak";};
		_unit addItemToVest "rhs_mag_rgo";
		_unit addBackpack "B_TacticalPack_blk";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "hlc_30Rnd_762x39_b_ak";};
		_unit addItemToBackpack "hlc_30Rnd_762x39_t_ak";

		_unit addWeapon "rhs_weap_akmn";
		_unit addPrimaryWeaponItem "rhs_acc_dtkakm";
		_unit addWeapon "rhs_weap_rpg26";
		_unit addWeapon "Binocular";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};

// LOADOUT: CARABINEER
	case "car":
	{
		_unit addmagazines [_carbinemag,7];
		_unit addmagazines [_carbinemag_tr,2];
		_unit addweapon _carbine;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_mgrenade,3];
		_unit addmagazines [_smokegrenade,3];
		["car"] call _backpack;
	};

// LOADOUT: SUBMACHINEGUNNER
	case "smg":
	{
		_unit addmagazines [_smgmag,7];
		_unit addweapon _smg;
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_mgrenade,3];
		_unit addmagazines [_smokegrenade,3];
		["smg"] call _backpack;
	};

// LOADOUT: GRENADIER
	case "gren":
	{
		_unit addmagazines [_glriflemag,7];
		_unit addmagazines [_glriflemag_tr,2];
		_unit addweapon _glrifle;
		_unit addmagazines [_glmag,6];
		_unit addmagazines [_glsmokewhite,2];
		_unit addmagazines [_grenade,3];
		_unit addmagazines [_mgrenade,3];
		_unit addmagazines [_smokegrenade,2];
		["g"] call _backpack;
	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_riflemag, 8];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];
	};

// CARGO: TRUCK - room for 50 weapons and 200 cargo items
	case "v_tr":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 10];
		_unit addMagazineCargoGlobal [_riflemag, 40];
		_unit addMagazineCargoGlobal [_glriflemag, 40];
		_unit addMagazineCargoGlobal [_carbinemag, 40];
		_unit addMagazineCargoGlobal [_armag, 22];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 12];
		_unit addmagazineCargoGlobal [_mgrenade,12];
		_unit addMagazineCargoGlobal [_smokegrenade, 12];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 4];
		_unit addMagazineCargoGlobal [_glmag, 12];
		_unit addMagazineCargoGlobal [_glsmokewhite, 12];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];
	};

// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 4];
		_unit addMagazineCargoGlobal [_riflemag, 20];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_armag, 8];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_mgrenade,8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 8];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];
	};

// CRATE: Small, ammo for 1 fireteam
	case "crate_small":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 5];
		_unit addMagazineCargoGlobal [_glriflemag, 5];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_carbinemag, 5];
		_unit addMagazineCargoGlobal [_glmag, 5];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addMagazineCargoGlobal [_ratmag, 2];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addMagazineCargoGlobal [_mgrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];
};

// CRATE: Medium, ammo for 1 squad
	case "crate_med":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_riflemag, 15];
		_unit addMagazineCargoGlobal [_glriflemag, 20];
		_unit addMagazineCargoGlobal [_armag, 15];
		_unit addMagazineCargoGlobal [_carbinemag, 20];
		_unit addMagazineCargoGlobal [_glmag, 20];
		_unit addMagazineCargoGlobal [_glsmokewhite,16];
		_unit addMagazineCargoGlobal [_ratmag, 6];
		_unit addMagazineCargoGlobal [_grenade, 25];
		_unit addMagazineCargoGlobal [_mgrenade, 25];
		_unit addMagazineCargoGlobal [_smokegrenade, 25];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 6];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 100];
		_unit addItemCargoGlobal ["ACE_morphine", 50];
		_unit addItemCargoGlobal ["ACE_epinephrine", 25];
		_unit addItemCargoGlobal ["ACE_bloodIV", 10];
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

// Handle weapon attachments
// #include "f_assignGear_attachments.sqf";

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;
