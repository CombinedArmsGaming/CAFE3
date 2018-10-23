
#define FACTION indfor


// Commander Loadout

_baseLoadout = [["arifle_MXC_ACO_F","","","optic_Aco",["30Rnd_65x39_caseless_mag_Tracer",30],[],""],[],["hgun_Pistol_heavy_01_MRD_F","","","optic_MRD",["11Rnd_45ACP_Mag",11],[],""],["U_B_CombatUniform_mcam",[["ACE_fieldDressing",10],["ACE_bloodIV_250",1],["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_morphine",10],["ACE_epinephrine",1]]],["V_BandollierB_rgr",[["30Rnd_65x39_caseless_mag",4,30],["30Rnd_65x39_caseless_mag_Tracer",2,30],["11Rnd_45ACP_Mag",2,11]]],[],"H_MilCap_mcamo","fow_g_gloves2",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(CO,FACTION,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_MX_GL_F","","acc_pointer_IR","optic_Hamr",["30Rnd_65x39_caseless_mag_Tracer",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam_vest",[["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_bloodIV_250",1],["ACE_epinephrine",1]]],["V_PlateCarrierGL_rgr",[["16Rnd_9x21_Mag",2,17],["HandGrenade",2,1],["B_IR_Grenade",2,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1],["Chemlight_green",2,1],["30Rnd_65x39_caseless_mag",6,30]]],["B_AssaultPack_rgr_Medic",[["30Rnd_65x39_caseless_mag_Tracer",2,30],["1Rnd_HE_Grenade_shell",9,1],["1Rnd_Smoke_Grenade_shell",4,1],["1Rnd_SmokeGreen_Grenade_shell",2,1],["1Rnd_SmokeOrange_Grenade_shell",2,1]]],"H_HelmetB_desert","rhs_googles_orange",["Laserdesignator","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(FTL,FACTION,_baseLoadout);


// Squad lead Loadout

COPY_LOADOUT(SL,FACTION,FTL);


// Medic Loadout

_baseLoadout = [["arifle_MX_F","","acc_pointer_IR","optic_Holosight",["30Rnd_65x39_caseless_mag_Tracer",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam_tshirt",[["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_fieldDressing",10],["ACE_morphine",10]]],["V_PlateCarrierSpec_rgr",[["30Rnd_65x39_caseless_mag",6,30],["16Rnd_9x21_Mag",2,17],["SmokeShell",4,1],["SmokeShellGreen",1,1],["SmokeShellBlue",1,1],["SmokeShellOrange",1,1]]],["B_AssaultPack_rgr_Medic",[["ACE_bloodIV",8],["ACE_Banana",1],["ACE_fieldDressing",30],["ACE_morphine",30],["ACE_epinephrine",15]]],"H_HelmetB_light_desert","fow_g_gloves4",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(MED,FACTION,_baseLoadout);


// Autorifleman Loadout

_baseLoadout = [["LMG_Mk200_F","","acc_pointer_IR","optic_Hamr",["200Rnd_65x39_cased_Box_Tracer",200],[],"rhs_acc_harris_swivel"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam_tshirt",[["ACE_fieldDressing",10],["ACE_bloodIV_250",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACRE_PRC343",1]]],["V_PlateCarrier2_rgr",[["16Rnd_9x21_Mag",3,17],["200Rnd_65x39_cased_Box",1,200],["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1]]],["B_AssaultPack_rgr",[["200Rnd_65x39_cased_Box",2,200],["200Rnd_65x39_cased_Box_Tracer",1,200]]],"H_HelmetB_grass","fow_g_gloves6",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(AR,FACTION,_baseLoadout);


// Assistant AR Loadout

_baseLoadout = [["LMG_Mk200_F","","acc_pointer_IR","optic_Hamr",["200Rnd_65x39_cased_Box_Tracer",200],[],"rhs_acc_harris_swivel"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam_tshirt",[["ACE_fieldDressing",10],["ACE_bloodIV_250",1],["ACE_epinephrine",1],["ACE_morphine",10],["ACRE_PRC343",1]]],["V_PlateCarrier2_rgr",[["16Rnd_9x21_Mag",3,17],["200Rnd_65x39_cased_Box",1,200],["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1]]],["B_AssaultPack_rgr",[["200Rnd_65x39_cased_Box",2,200],["200Rnd_65x39_cased_Box_Tracer",1,200]]],"H_HelmetB_grass","fow_g_gloves6",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(AAR,FACTION,_baseLoadout);


// Light anti-tank Loadout

_baseLoadout = [["arifle_MX_ACO_pointer_F","","acc_pointer_IR","optic_Hamr",["30Rnd_65x39_caseless_mag_Tracer",30],[],""],["launch_NLAW_F","","","",[],[],""],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_epinephrine",1],["ACE_fieldDressing",10],["ACE_morphine",10]]],["V_PlateCarrier2_rgr",[["30Rnd_65x39_caseless_mag",5,30],["16Rnd_9x21_Mag",2,17],["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1],["30Rnd_65x39_caseless_mag_Tracer",1,30]]],[],"H_HelmetB_sand","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(LAT,FACTION,_baseLoadout);


// Marksman Loadout

_baseLoadout = [["arifle_MXM_Hamr_LP_BI_F","","acc_pointer_IR","optic_DMS",["30Rnd_65x39_caseless_mag",30],[],"rhs_acc_harris_swivel"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",10],["ACE_epinephrine",1],["ACE_morphine",10]]],["V_PlateCarrier1_rgr",[["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1],["30Rnd_65x39_caseless_mag",6,30],["30Rnd_65x39_caseless_mag_Tracer",2,30],["16Rnd_9x21_Mag",2,17]]],[],"H_HelmetB_grass","G_Aviator",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(MK,FACTION,_baseLoadout);


// Rifleman Loadout

_baseLoadout = [["arifle_MXM_Hamr_LP_BI_F","","acc_pointer_IR","optic_DMS",["30Rnd_65x39_caseless_mag",30],[],"rhs_acc_harris_swivel"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_bloodIV_250",1],["ACE_fieldDressing",10],["ACE_epinephrine",1],["ACE_morphine",10]]],["V_PlateCarrier1_rgr",[["SmokeShell",3,1],["SmokeShellGreen",1,1],["rhs_mag_m67",3,1],["30Rnd_65x39_caseless_mag",6,30],["30Rnd_65x39_caseless_mag_Tracer",2,30],["16Rnd_9x21_Mag",2,17]]],[],"H_HelmetB_grass","G_Aviator",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(RIF,FACTION,_baseLoadout);


// Crewman Loadout

_baseLoadout = [["SMG_01_F","ACE_muzzle_mzls_smg_01","acc_flashlight_smg_01","",["30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",25],[],""],[],[],["U_B_CombatUniform_mcam_vest",[["ACRE_PRC343",1],["ACRE_PRC152",1],["ACE_fieldDressing",10],["ACE_epinephrine",1],["ACE_bloodIV_250",1],["ACE_morphine",10]]],["V_BandollierB_rgr",[["30Rnd_45ACP_Mag_SMG_01_Tracer_Red",5,25],["SmokeShell",4,1],["SmokeShellPurple",1,1],["rhs_mag_m67",1,1]]],[],"H_HelmetCrew_B","G_Tactical_Clear",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(CREW,FACTION,_baseLoadout);
