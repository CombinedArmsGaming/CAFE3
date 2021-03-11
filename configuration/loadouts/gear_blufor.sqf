
#define FACTION blufor

BEGIN_LOADOUTS;




// Rifleman Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_tourniquet",2],["ACE_packingBandage",3],["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_Flashlight_XL50",1],["ACRE_PRC343_ID_1",1],["16Rnd_9x21_Mag",1,17],["SmokeShell",2,1]]],["V_PlateCarrier2_rgr",[["HandGrenade",4,1],["30Rnd_65x39_caseless_mag_Tracer",3,30],["30Rnd_65x39_caseless_mag",7,30]]],["B_AssaultPack_rgr",[["ACE_salineIV",1],["ACE_EntrenchingTool",1],["30Rnd_65x39_caseless_mag_Tracer",1,30]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam_tshirt");

ADD_HAT(rif,"H_HelmetB_snakeskin");
ADD_HAT(rif,"H_HelmetB_grass");
ADD_HAT(rif,"H_HelmetB");


// Commander Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_splint",2],["ACE_epinephrine",1],["ACRE_PRC152",1]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_khk",[["NVGoggles",1]]],"H_MilCap_mcamo","G_Tactical_Clear",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_MX_GL_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],["3Rnd_HE_Grenade_shell",3],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_splint",2],["ACE_epinephrine",1],["ACRE_PRC152",1]]],["V_PlateCarrierGL_mtp",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_mag_Tracer",3,30],["30Rnd_65x39_caseless_mag",6,30],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_rgr",[["3Rnd_HE_Grenade_shell",4,3],["3Rnd_Smoke_Grenade_shell",3,3],["3Rnd_SmokeRed_Grenade_shell",2,3],["3Rnd_SmokeBlue_Grenade_shell",2,3],["SmokeShellRed",1,1],["SmokeShellBlue",2,1]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_bloodIV",1],["ACRE_PRC152",1]]],["V_PlateCarrier1_rgr",[["ACE_bloodIV",4],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",2,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShell",2,1],["16Rnd_9x21_Mag",1,17]]],["B_Kitbag_mcamo",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",3],["ACE_adenosine",5],["ACE_bloodIV",5],["ACE_splint",20],["ACE_tourniquet",10],["FSGm_ItemMedicBagMil",1],["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Corpsman Loadout

_baseLoadout = [["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343_ID_3",1],["ACRE_PRC148_ID_1",1],["ACE_bloodIV",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["16Rnd_9x21_Mag",1,17]]],["V_PlateCarrier1_rgr",[["ACE_bloodIV",4],["HandGrenade",2,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",5,30],["SmokeShell",2,1]]],["B_Kitbag_mcamo",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",3],["ACE_adenosine",5],["ACE_bloodIV",6],["ACE_splint",20],["ACE_tourniquet",10],["ACE_EntrenchingTool",1]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [["arifle_MX_SW_F","","acc_flashlight","optic_Holosight",["100Rnd_65x39_caseless_mag",100],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_1",1],["ACE_splint",2],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["16Rnd_9x21_Mag",2,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["100Rnd_65x39_caseless_mag",3,100],["100Rnd_65x39_caseless_mag_Tracer",1,100],["SmokeShell",2,1]]],["B_AssaultPack_rgr",[["ACE_SpareBarrel",1,1],["100Rnd_65x39_caseless_mag",3,100],["100Rnd_65x39_caseless_mag_Tracer",1,100]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Hamr",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_3",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_splint",2],["16Rnd_9x21_Mag",1,17]]],["V_PlateCarrier2_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",6,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShell",2,1]]],["B_Kitbag_mcamo",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["100Rnd_65x39_caseless_mag",6,100],["100Rnd_65x39_caseless_mag_Tracer",3,100]]],"H_HelmetB_snakeskin","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],["ACE_launch_NLAW_ready_F","","","",["NLAW_F",1],[],""],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_1",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_splint",2],["16Rnd_9x21_Mag",1,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",2,1]]],["B_AssaultPack_rgr",[["ACE_EntrenchingTool",1]]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["arifle_MXM_F","","acc_flashlight","optic_SOS",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACE_RangeCard",1],["ACRE_PRC343_ID_3",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_splint",2],["16Rnd_9x21_Mag",1,17]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_mag",8,30],["30Rnd_65x39_caseless_mag_Tracer",2,30]]],["B_AssaultPack_rgr",[]],"H_HelmetB_snakeskin","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_01_F","","acc_flashlight_smg_01","optic_ACO_grn_smg",["30Rnd_45ACP_Mag_SMG_01",25],[],""],[],[],["U_B_HeliPilotCoveralls",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACE_splint",2],["ACRE_PRC343_ID_1",1],["ACRE_PRC148_ID_2",1],["ACRE_PRC152_ID_2",1]]],["V_Chestrig_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",4,1],["30Rnd_45ACP_Mag_SMG_01",5,25],["SmokeShellBlue",1,1],["SmokeShellRed",1,1]]],["B_FieldPack_oli",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_B","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Zeus

_baseLoadout = [["arifle_SDAR_F","","","",["30Rnd_556x45_Stanag_Tracer_Red",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343_ID_3",1],["ACRE_PRC148",1],["ACRE_PRC152",1],["ACE_Banana",1]]],["V_PlateCarrier1_rgr",[["ACE_Banana",1],["ACE_CableTie",10],["16Rnd_9x21_Mag",2,17],["30Rnd_556x45_Stanag_Tracer_Red",3,30]]],["B_AssaultPack_rgr",[["ACE_Banana",1],["ACE_UAVBattery",1],["ACE_EntrenchingTool",1],["ACE_DefusalKit",1],["ToolKit",1],["ACE_wirecutter",1]]],"H_HelmetCrew_I","G_Lowprofile",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(zeus,_baseLoadout);
COPY_ADDONS(zeus,rif);



// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,6);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_mag_Tracer",10);
ADD_ITEMS_TO_CRATE(small,"100Rnd_65x39_caseless_mag_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"3Rnd_Smoke_Grenade_shell",4);
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeRed_Grenade_shell",2);
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeBlue_Grenade_shell",2);

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",6);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(small,20);
ADD_SPLINTS_TO_CRATE(small,15);
ADD_MEDS_TO_CRATE(small,15);
ADD_BLOOD_TO_CRATE(small,8);

ADD_BACKPACKS_TO_CRATE(small,rif,2);

ADD_ITEMS_TO_CRATE(small,"ACRE_PRC343",6);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC152",2);
ADD_ITEMS_TO_CRATE(small,"ACRE_PRC148",2);
ADD_ITEMS_TO_CRATE(small,"Binocular",2);
ADD_ITEMS_TO_CRATE(small,"Toolkit",1);

FINALIZE_CRATE(small);


// Medium crate loadout
CREATE_CRATE(med);

ADD_RIFLE_TO_CRATE(med,rif,4);
ADD_LAUNCHER_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,15);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,10);

ADD_ITEMS_TO_CRATE(med,"30Rnd_65x39_caseless_mag_Tracer",20);
ADD_ITEMS_TO_CRATE(med,"100Rnd_65x39_caseless_mag_Tracer",10);

ADD_ITEMS_TO_CRATE(med,"3Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"3Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(med,"3Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",2);

ADD_BANDAGES_TO_CRATE(med,40);
ADD_SPLINTS_TO_CRATE(med,30);
ADD_MEDS_TO_CRATE(med,30);
ADD_BLOOD_TO_CRATE(med,20);

ADD_BACKPACKS_TO_CRATE(med,rif,4);

ADD_ITEMS_TO_CRATE(med,"ACRE_PRC343",12);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC152",4);
ADD_ITEMS_TO_CRATE(med,"ACRE_PRC148",4);
ADD_ITEMS_TO_CRATE(med,"Binocular",4);
ADD_ITEMS_TO_CRATE(med,"Toolkit",1);

FINALIZE_CRATE(med);


// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

COPY_LOADOUT(default,rif);
