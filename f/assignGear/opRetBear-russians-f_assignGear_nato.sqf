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
_rifle = "rhs_weap_ak74m";
_riflemag = "rhs_30Rnd_545x39_7N10_AK";
_riflemag_tr = "hlc_30Rnd_545x39_t_ak";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner, Carabineer)
_carbine = "rhs_weap_ak74m";
_carbinemag = "rhs_30Rnd_545x39_7N10_AK";
_carbinemag_tr = "hlc_30Rnd_545x39_t_ak";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot, Submachinegunner)
_smg = "SMG_01_F";
_smgmag = "30Rnd_45ACP_Mag_SMG_01";
_smgmag_tr = "30Rnd_45ACP_Mag_SMG_01_tracer_green";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "rhs_weap_ak74m_gp25";
_glriflemag = "rhs_30Rnd_545x39_7N10_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_7N10_AK";
_glmag = "rhs_VOG25";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "hlc_GRD_White";
_glsmokegreen = "hlc_GRD_Green";
_glsmokered = "hlc_GRD_Red";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "3Rnd_UGL_FlareWhite_F";
_glflarered = "3Rnd_UGL_FlareRed_F";
_glflareyellow = "3Rnd_UGL_FlareYellow_F";
_glflaregreen = "3Rnd_UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "rhs_weap_makarov_pm";
_pistolmag = "rhs_mag_9x18_8_57N181S";

// Grenades
_grenade = "rhs_mag_rgd5";
_Mgrenade = "rhs_mag_rgd5";
_smokegrenade = "rhs_mag_rdg2_white";
_smokegrenadegreen = "rhs_mag_rdg2_black";

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
_AR = "rhs_weap_pkm";
_ARmag = "rhs_100Rnd_762x54mmR";
_ARmag_tr = "rhs_100Rnd_762x54mmR";

// Medium MG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR";

// NON-DLC ALTERNATIVE:
// _MMG = "LMG_Zafir_F";
// _MMGmag = ""150Rnd_762x54_Box"";
// _MMGmag_tr = ""150Rnd_762x54_Box"_Tracer";

// Marksman rifle
_DMrifle = "rhs_weap_svdp";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// MAR-10
//_DMrifle = "srifle_DMR_02_F";
//_DMriflemag = "10Rnd_338_Mag";

// Rifleman AT
_RAT = "launch_RPG32_F";
_RATmag = "RPG32_F";

// Medium AT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7V_mag";
_MATmag2 = "rhs_rpg7_PG7VL_mag";

// Surface Air
_SAM = "launch_B_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "rhs_weap_rpg7";
_HATmag1 = "rhs_rpg7_PG7V_mag";
_HATmag2 = "rhs_rpg7_PG7VL_mag";

// Sniper
_SNrifle = "rhs_weap_svdp";
_SNrifleMag = "rhs_10Rnd_762x54mmR_7N1";

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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "FirstAidKit";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "rhs_10Rnd_762x54mmR_7N1";};
		_unit addVest "rhs_6b23_digi_sniper";
		_unit addItemToVest "ACE_fieldDressing";
		for "_i" from 1 to 6 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
		_unit addItemToVest "rhs_mag_rgd5";
		_unit addHeadgear "rhs_fieldcap_helm_digi";

		_unit addWeapon "rhs_weap_svdp";
		_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
		_unit addWeapon "rhs_weap_makarov_pm";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "rhs_1PN138";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "Laserbatteries";
		_unit addVest "rhs_6b23_digi_6sh92_headset_mapcase";
		_unit addItemToVest "ACE_morphine";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_VOG25";};
		_unit addItemToVest "rhs_GRD40_White";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_30Rnd_545x39_t_ak";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_GRD_White";};
		_unit addItemToBackpack "hlc_GRD_Red";
		_unit addItemToBackpack "hlc_GRD_purple";
		_unit addItemToBackpack "hlc_GRD_blue";
		_unit addHeadgear "rhs_6b27m_green";

		_unit addWeapon "rhs_weap_ak74m_gp25";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "rhs_weap_makarov_pm";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "rhs_1PN138";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "Laserbatteries";
		_unit addVest "rhs_6b23_digi_6sh92_headset_mapcase";
		_unit addItemToVest "ACE_morphine";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 5 do {_unit addItemToVest "rhs_VOG25";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "hlc_GRD_White";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToBackpack "hlc_GRD_Red";
		_unit addItemToBackpack "hlc_GRD_purple";
		_unit addItemToBackpack "hlc_GRD_blue";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GDM40";};
		_unit addHeadgear "rhs_beanie_green";

		_unit addWeapon "rhs_weap_ak74m_fullplum_gp25";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "rhs_weap_makarov_pm";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_30Rnd_545x39_t_ak";};
		_unit addVest "rhs_6b23_digi_6sh92";
		_unit addItemToVest "ACE_bloodIV_500";
		_unit addItemToVest "ACRE_PRC343";
		_unit addItemToVest "ACE_EntrenchingTool";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToVest "rhs_mag_rgd5";
		_unit addItemToVest "rhs_mag_rdg2_white";
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToBackpack "rhs_mag_rdg2_white";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_rgd5";};
		_unit addHeadgear "rhs_6b27m_digi";
		_unit addGoggles "rhs_scarf";

		_unit addWeapon "rhs_weap_ak74m";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";

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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
		_unit addVest "rhs_6b23_digi_rifleman";
		for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToVest "hlc_30Rnd_545x39_t_ak";
		_unit addBackpack "rhs_rpg_at";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
		_unit addHeadgear "rhs_6b27m_green";

		_unit addWeapon "rhs_weap_ak74m_plummag";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "rhs_weap_rpg7";
		_unit addSecondaryWeaponItem "rhs_acc_pgo7v3";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	
	};
	
	case "amat":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
		_unit addVest "rhs_6b23_digi_rifleman";
		for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToVest "hlc_30Rnd_545x39_t_ak";
		_unit addBackpack "rhs_rpg";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7V_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		_unit addHeadgear "rhs_6b27m_green";

		_unit addWeapon "rhs_weap_ak74m_plummag";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 7 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "rhs_mag_rdg2_white";
		_unit addItemToUniform "rhs_mag_rgd5";
		_unit addVest "rhs_6b23_digi";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		_unit addBackpack "rhs_sidorMG";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
		_unit addHeadgear "rhs_6b27m_green_ess";
		_unit addGoggles "rhs_scarf";

		_unit addWeapon "rhs_weap_pkm";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	case "aar":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "rhs_mag_rdg2_white";
		_unit addItemToUniform "rhs_mag_rgd5";
		_unit addVest "rhs_6b23_digi_6sh92";
		for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_30Rnd_545x39_t_ak";};
		_unit addItemToVest "rhs_mag_rdg2_white";
		_unit addBackpack "rhs_sidorMG";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
		_unit addHeadgear "rhs_6b27m_digi";

		_unit addWeapon "rhs_weap_ak74m";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	case "am":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "rhs_mag_rdg2_white";
		_unit addItemToUniform "rhs_mag_rgd5";
		_unit addVest "rhs_6b23_digi_6sh92";
		for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_30Rnd_545x39_t_ak";};
		_unit addItemToVest "rhs_mag_rdg2_white";
		_unit addBackpack "B_Carryall_oli";
		for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
		_unit addHeadgear "rhs_6b27m_digi";

		_unit addWeapon "rhs_weap_ak74m";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		
	};
	
	case "gl":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "rhs_mag_rdg2_white";
		_unit addItemToUniform "rhs_mag_rgd5";
		_unit addVest "rhs_6b23_digi_6sh92_vog";
		for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_30Rnd_545x39_t_ak";};
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_VOG25";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VG40TB";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GDM40";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "hlc_GRD_White";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_GRD_green";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_GRD_orange";};
		_unit addHeadgear "rhs_6b27m_green_ess";

		_unit addWeapon "rhs_weap_ak74m_gp25";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "hlc_30Rnd_545x39_t_ak";};
		_unit addVest "rhs_6b23_digi_6sh92";
		_unit addItemToVest "ACE_bloodIV_500";
		_unit addItemToVest "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToVest "rhs_mag_rgd5";
		_unit addItemToVest "rhs_mag_rdg2_white";
		_unit addBackpack "B_FieldPack_oli";
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
		_unit addItemToBackpack "rhs_mag_rdg2_white";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_rgd5";};
		_unit addHeadgear "rhs_6b27m_digi";
		_unit addGoggles "rhs_scarf";

		_unit addWeapon "rhs_weap_ak74m";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";
		_unit addWeapon "rhs_weap_rpg26";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
		_unit addItemToUniform "rhs_mag_rgd5";
		_unit addItemToUniform "ACE_HandFlare_Red";
		_unit addVest "rhs_6b23_digi_medic";
		for "_i" from 1 to 30 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 30 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addBackpack "rhs_assault_umbts_medic";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
		_unit addHeadgear "rhs_6b27m_digi";

		_unit addWeapon "rhs_weap_ak74m";
		_unit addPrimaryWeaponItem "rhs_acc_dtk";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
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

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "rhs_mag_rdg2_black";
		_unit addVest "rhs_6b23_crewofficer";
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		_unit addHeadgear "rhs_fieldcap";

		_unit addWeapon "rhs_weap_aks74_2";
		_unit addPrimaryWeaponItem "rhs_acc_dtk2";
		_unit addPrimaryWeaponItem "rhs_acc_perst1ik";
		_unit addWeapon "rhs_weap_tr8";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
	
	};
	
	case "drv":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
		_unit addVest "rhs_6b23_digi";
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		_unit addHeadgear "rhs_fieldcap_digi";

		_unit addWeapon "rhs_weap_aks74u";
		_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
		_unit addWeapon "rhs_weap_pya";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	case "crew":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "rhs_uniform_msv_emr";
		_unit addItemToUniform "ACRE_PRC343";
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
		_unit addVest "rhs_6b23_digi_crew";
		for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
		_unit addHeadgear "rhs_tsh4_ess";

		_unit addWeapon "rhs_weap_aks74u";
		_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
		_unit addWeapon "rhs_weap_pya";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";

	};
	
	case "slav-at":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_US_Fatigue_13";
		for "_i" from 1 to 15 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACRE_PRC152";
		_unit addVest "rhs_6b23_6sh92_radio";
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
		for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
		for "_i" from 1 to 4 do {_unit addItemToVest "HandGrenade";};
		_unit addBackpack "SOUP_Kitbag_PACT_KLMK";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_CableTie";};
		_unit addItemToBackpack "ACE_wirecutter";
		_unit addItemToBackpack "ACE_Flashlight_XL50";
		_unit addItemToBackpack "ACE_SpraypaintBlue";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_rpg7_PG7VL_mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellBlue";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "SmokeShell";};
		for "_i" from 1 to 6 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_Chemlight_HiOrange";};
		_unit addHeadgear "rhs_tsh4_ess_bala";
		_unit addGoggles "rhsusf_shemagh2_od";

		_unit addWeapon "rhs_weap_ak74m_2mag_npz";
		_unit addPrimaryWeaponItem "rhs_acc_tgpa";
		_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
		_unit addPrimaryWeaponItem "optic_MRCO";
		_unit addWeapon "rhs_weap_rpg7";
		_unit addWeapon "rhs_weap_pb_6p9";
		_unit addHandgunItem "rhs_acc_6p9_suppressor";
		_unit addWeapon "Laserdesignator_03";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_INDEP";
		
	};
	
	case "slav-mk":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		comment "Add containers";
		_unit forceAddUniform "SOUP_CombatUniform_KLMK_3_B";
		for "_i" from 1 to 15 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
		_unit addItemToUniform "Cre8ive_GeigerScout";
		_unit addItemToUniform "ACE_Flashlight_XL50";
		_unit addItemToUniform "ACRE_PRC343";
		_unit addVest "rhs_6b23_6sh92_headset_mapcase";
		for "_i" from 1 to 9 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_9x21_Red_Mag";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_rgo";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 5 do {_unit addItemToVest "ACE_Chemlight_HiYellow";};
		_unit addBackpack "rhs_assault_umbts";
		_unit addItemToBackpack "ACE_M26_Clacker";
		for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 9 do {_unit addItemToBackpack "ACE_morphine";};
		_unit addItemToBackpack "ACE_EntrenchingTool";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Cre8ive_Med_KIO3";};
		for "_i" from 1 to 10 do {_unit addItemToBackpack "rhs_10Rnd_762x54mmR_7N1";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		_unit addHeadgear "rhs_6b26_ess_bala";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_svdp_wd_npz";
		_unit addPrimaryWeaponItem "rhs_acc_tgpv2";
		_unit addPrimaryWeaponItem "optic_DMS";
		_unit addWeapon "hgun_Rook40_F";
		_unit addHandgunItem "hlc_muzzle_TiRant9S";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";

	};
	
	case "slav-sn":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "SOUP_CombatUniform_JUMPER_PACT_KLMK";
		for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 13 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_epinephrine";};
		_unit addItemToUniform "ACRE_PRC343";
		_unit addItemToUniform "UK3CB_BAF_338_5Rnd_Tracer";
		_unit addVest "rhs_6b23_6sh116_od";
		_unit addItemToVest "ACE_Flashlight_XL50";
		for "_i" from 1 to 5 do {_unit addItemToVest "ACE_CableTie";};
		_unit addItemToVest "ACE_wirecutter";
		_unit addItemToVest "UK3CB_BAF_MaxiKite";
		_unit addItemToVest "Cre8ive_GeigerScout";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_blue";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShellBlue";};
		for "_i" from 1 to 5 do {_unit addItemToVest "UK3CB_BAF_338_5Rnd_Tracer";};
		_unit addBackpack "SOUP_Assault_Pack_PACT_KLMK";
		_unit addItemToBackpack "ToolKit";
		_unit addItemToBackpack "UK3CB_BAF_Silencer_L115A3";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_9x18_8_57N181S";};
		for "_i" from 1 to 3 do {_unit addItemToBackpack "UK3CB_BAF_338_5Rnd_Tracer";};
		_unit addHeadgear "rhs_6b7_1m_bala2_olive";

		_unit addWeapon "UK3CB_BAF_L115A3";
		_unit addPrimaryWeaponItem "FHQ_optic_LeupoldERT";
		_unit addWeapon "rhs_weap_pb_6p9";
		_unit addHandgunItem "rhs_acc_6p9_suppressor";
		_unit addWeapon "Laserdesignator_03";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";
		_unit linkItem "UK3CB_BAF_HMNVS";

	};
	
	case "slav-ar":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_US_Fatigue_13";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 15 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACE_bloodIV";
		_unit addVest "LOP_V_6B23_headset_mapcase";
		_unit addItemToVest "ACRE_PRC152";
		for "_i" from 1 to 3 do {_unit addItemToVest "UK3CB_BAF_SmokeShellBlue";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "hlc_75Rnd_762x39_AP_rpk";
		_unit addBackpack "SOUP_Carryall_PACT_KLMK";
		_unit addItemToBackpack "rhs_acc_pso1m2";
		for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_bloodIV";};
		for "_i" from 1 to 26 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "hlc_75Rnd_762x39_AP_rpk";};
		_unit addHeadgear "rhs_6b7_1m_olive";
		_unit addGoggles "rhsusf_shemagh2_grn";

		_unit addWeapon "hlc_rifle_rpk_75rnd";
		_unit addPrimaryWeaponItem "rhs_acc_dtk1l";
		_unit addPrimaryWeaponItem "rhs_acc_pkas";
		_unit addWeapon "Laserdesignator";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_INDEP";

	};
	
	case "slav-lmg":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		_unit forceAddUniform "LOP_U_US_Fatigue_13";
		for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};
		for "_i" from 1 to 15 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
		_unit addVest "LOP_V_6B23_headset_mapcase";
		_unit addItemToVest "ACRE_PRC152";
		_unit addItemToVest "30Rnd_9x21_Red_Mag";
		for "_i" from 1 to 3 do {_unit addItemToVest "UK3CB_BAF_SmokeShellBlue";};
		for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m67";};
		_unit addItemToVest "ACE_Chemlight_HiRed";
		_unit addBackpack "SOUP_Carryall_PACT_KLMK";
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR_7BZ3";};
		_unit addHeadgear "rhs_altyn_visordown";
		_unit addGoggles "SFG_Tac_BeardO";

		_unit addWeapon "rhs_weap_pkp";
		_unit addPrimaryWeaponItem "rhs_acc_pso1m21_pkp";
		_unit addWeapon "hgun_Rook40_F";
		_unit addHandgunItem "hlc_muzzle_TiRant9S";
		_unit addWeapon "Laserdesignator_03";

		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_OPFOR";
		
	};
	
	
	case "slav-sl":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;

		comment "Add containers";
		_unit forceAddUniform "LOP_U_US_Fatigue_13";
		for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_fieldDressing";};
		for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_morphine";};
		_unit addItemToUniform "ACRE_PRC152";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x19_17";};
		_unit addVest "rhs_6b13_EMR_6sh92_headset_mapcase";
		for "_i" from 1 to 5 do {_unit addItemToVest "ACE_morphine";};
		for "_i" from 1 to 15 do {_unit addItemToVest "ACE_fieldDressing";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_45Rnd_545X39_7N22_AK";};
		for "_i" from 1 to 3 do {_unit addItemToVest "rhs_VOG25";};
		for "_i" from 1 to 2 do {_unit addItemToVest "hlc_GRD_blue";};
		_unit addBackpack "SOUP_Kitbag_PACT_KLMK";
		for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_morphine";};
		_unit addItemToBackpack "ACE_Flashlight_XL50";
		_unit addItemToBackpack "ACE_EntrenchingTool";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_black";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rgd5";};
		for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_45Rnd_545X39_7N22_AK";};
		for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_VOG25";};
		_unit addHeadgear "rhs_6b47";
		_unit addGoggles "rhsusf_shemagh2_grn";

		comment "Add weapons";
		_unit addWeapon "rhs_weap_ak74m_gp25_npz";
		_unit addPrimaryWeaponItem "rhs_acc_dtk4short";
		_unit addPrimaryWeaponItem "rhs_acc_1p87";
		_unit addWeapon "rhs_weap_rpg26";
		_unit addWeapon "rhs_weap_pya";
		_unit addWeapon "Laserdesignator_03";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadioAcreFlagged";
		_unit linkItem "ItemGPS";

	};

// CARGO: CAR - room for 10 weapons and 50 cargo items
	case "v_car":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addWeaponCargoGlobal [_carbine, 2];
		_unit addMagazineCargoGlobal [_dmriflemag, 3];
		_unit addMagazineCargoGlobal [_riflemag, 5];
		_unit addMagazineCargoGlobal [_glriflemag, 8];
		_unit addMagazineCargoGlobal [_carbinemag, 10];
		_unit addMagazineCargoGlobal [_armag, 5];
		_unit addMagazineCargoGlobal [_ratmag, 1];
		_unit addMagazineCargoGlobal [_grenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenade, 4];
		_unit addMagazineCargoGlobal [_smokegrenadegreen, 2];
		_unit addMagazineCargoGlobal [_glmag, 4];
		_unit addMagazineCargoGlobal [_glsmokewhite, 4];
		_unit addItemCargoGlobal ["Toolkit", 1];
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
		_unit addMagazineCargoGlobal [_dmriflemag, 5];
		_unit addMagazineCargoGlobal [_riflemag, 35];
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
		_unit addItemCargoGlobal ["Toolkit", 1];
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
		_unit addMagazineCargoGlobal [_dmriflemag, 5];
		_unit addMagazineCargoGlobal [_riflemag, 15];
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
		_unit addItemCargoGlobal ["Toolkit", 1];
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
		_unit addMagazineCargoGlobal [_dmriflemag, 3];
		_unit addMagazineCargoGlobal [_riflemag, 2];
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
		_unit addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_AK", 100];
		_unit addMagazineCargoGlobal ["rhs_mag_rgd5", 20];
		_unit addMagazineCargoGlobal ["rhs_mag_rdg2_white", 20];
		_unit addMagazineCargoGlobal ["hlc_30Rnd_545x39_t_ak", 40];
		_unit addMagazineCargoGlobal ["rhs_VOG25", 20];
		_unit addMagazineCargoGlobal ["rhs_VG40TB", 10];
		_unit addMagazineCargoGlobal ["rhs_GDM40", 2];
		_unit addMagazineCargoGlobal ["hlc_GRD_White", 10];
		_unit addMagazineCargoGlobal ["hlc_GRD_green", 4];
		_unit addMagazineCargoGlobal ["hlc_GRD_orange", 4];
		_unit addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 10];
		_unit addMagazineCargoGlobal ["rhs_rpg7_PG7V_mag", 10];
		_unit addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 5];
		_unit addMagazineCargoGlobal ["rhs_mag_9x18_8_57N181S", 10];
		_unit addMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 30];
		_unit addMagazineCargoGlobal ["hlc_75Rnd_762x39_AP_rpk", 10];
		_unit addMagazineCargoGlobal ["UK3CB_BAF_338_5Rnd_Tracer", 10];
		_unit addMagazineCargoGlobal ["30Rnd_9x21_Red_Mag", 4];

		_unit addItemCargoGlobal ["ACRE_PRC343", 20];
		_unit addItemCargoGlobal ["ACRE_PRC152", 5];
		_unit addItemCargoGlobal ["ACE_bloodIV", 40];
		_unit addItemCargoGlobal ["ACE_epinephrine", 20];
		_unit addItemCargoGlobal ["ACE_fieldDressing", 100];
		_unit addItemCargoGlobal ["ACE_morphine", 100];
		_unit addItemCargoGlobal ["Laserbatteries", 1];

		_unit addWeaponCargoGlobal ["rhs_weap_makarov_pm", 2];
		_unit addWeaponCargoGlobal ["rhs_weap_rpg7", 1];
		_unit addWeaponCargoGlobal ["rhs_weap_ak74m", 2];
		_unit addWeaponCargoGlobal ["Laserdesignator", 2];
	};

// CRATE: Large, ammo for 1 platoon
	case "crate_large":
{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_dmriflemag, 10];
		_unit addMagazineCargoGlobal [_riflemag, 35];
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
