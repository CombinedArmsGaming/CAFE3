
#define FACTION blufor




// Rifleman Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier2_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1]]],["B_AssaultPack_rgr",[["30Rnd_65x39_caseless_mag",6,30],["30Rnd_65x39_caseless_mag_Tracer",2,30]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam_tshirt");

ADD_HAT(rif,"H_HelmetB_snakeskin");
ADD_HAT(rif,"H_HelmetB_grass");
ADD_HAT(rif,"H_HelmetB");


// Commander Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC148",1],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",3,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",6,30]]],[],"H_MilCap_mcamo","G_Tactical_Clear",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_MX_GL_F","","acc_pointer_IR","optic_Holosight",["30Rnd_65x39_caseless_mag",30],["1Rnd_SmokeRed_Grenade_shell",1],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACRE_PRC148",1],["ACE_salineIV_250",1],["ACE_tourniquet",1],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrierGL_mtp",[["HandGrenade",2,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["SmokeShellRed",1,1],["SmokeShellBlue",1,1],["30Rnd_65x39_caseless_mag_Tracer",3,30],["30Rnd_65x39_caseless_mag",7,30]]],["B_AssaultPack_rgr",[["30Rnd_65x39_caseless_mag_Tracer",2,30],["3Rnd_HE_Grenade_shell",4,3],["3Rnd_Smoke_Grenade_shell",2,3],["1Rnd_SmokeRed_Grenade_shell",1,1],["1Rnd_SmokeBlue_Grenade_shell",2,1]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC148",1],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",3,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",6,30]]],["B_Kitbag_mcamo",[["ACE_morphine",15],["ACE_epinephrine",15],["ACE_fieldDressing",10],["ACE_packingBandage",15],["ACE_elasticBandage",15],["ACE_bloodIV",7],["ACE_bloodIV_500",2]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Autorifleman Loadout

_baseLoadout = [["arifle_MX_SW_F","","acc_flashlight","optic_Holosight",["100Rnd_65x39_caseless_mag_Tracer",100],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC148",1],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["100Rnd_65x39_caseless_mag",3,100],["100Rnd_65x39_caseless_mag_Tracer",1,100]]],["B_AssaultPack_rgr",[["ACE_SpareBarrel",1,1],["100Rnd_65x39_caseless_mag",2,100],["100Rnd_65x39_caseless_mag_Tracer",1,100]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier2_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1]]],["B_Kitbag_mcamo",[["100Rnd_65x39_caseless_mag",6,100],["100Rnd_65x39_caseless_mag_Tracer",2,100]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],["launch_NLAW_F","","","",["ACE_PreloadedMissileDummy",1],[],""],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1]]],["B_AssaultPack_rgr",[]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["arifle_MXM_F","","acc_pointer_IR","optic_Hamr",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["SmokeShell",4,1],["ACE_Chemlight_IR",1,1],["30Rnd_65x39_caseless_mag",8,30],["30Rnd_65x39_caseless_mag_Tracer",2,30]]],["B_AssaultPack_rgr",[]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_01_F","","acc_flashlight_smg_01","optic_ACO_grn_smg",["30Rnd_45ACP_Mag_SMG_01",25],[],""],[],[],["U_B_HeliPilotCoveralls",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC148",1]]],["V_Chestrig_oli",[["SmokeShell",4,1],["ACE_Chemlight_IR",1,1],["30Rnd_45ACP_Mag_SMG_01",5,25],["SmokeShellBlue",1,1],["SmokeShellRed",1,1]]],["B_FieldPack_oli",[["ToolKit",1]]],"H_HelmetCrew_B","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
