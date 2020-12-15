
#define FACTION indfor

BEGIN_LOADOUTS;




// Rifleman Loadout

_baseLoadout = [["arifle_Mk20_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACRE_PRC343_ID_18",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_salineIV",1]]],["V_PlateCarrierIA1_dgtl",[["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag",8,30]]],["B_AssaultPack_dgtl",[["ACE_EntrenchingTool",1]]],"H_HelmetIA_net","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_I_CombatUniform_shortsleeve");
ADD_UNIFORM(rif,"U_I_CombatUniform");


// Commander Loadout

_baseLoadout = [["arifle_Mk20C_F","","acc_flashlight","optic_Aco",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_OfficerUniform",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACRE_PRC343_ID_15",1],["ACRE_PRC148_ID_2",1],["ACE_splint",2],["ACE_tourniquet",2],["ACRE_PRC152_ID_1",1]]],["V_TacVest_oli",[["SmokeShell",4,1],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["9Rnd_45ACP_Mag",1,8],["30Rnd_556x45_Stanag",5,30]]],["B_AssaultPack_dgtl",[["NVGoggles_INDEP",1]]],"H_MilCap_dgtl","G_Squares",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_Mk20_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_556x45_Stanag",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACRE_PRC343_ID_18",1],["ACRE_PRC148_ID_2",1],["ACE_splint",2],["ACE_tourniquet",2],["ACRE_PRC152_ID_1",1]]],["V_PlateCarrierIAGL_dgtl",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",2,1],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag",7,30]]],["B_AssaultPack_dgtl",[["1Rnd_HE_Grenade_shell",15,1],["1Rnd_Smoke_Grenade_shell",6,1],["1Rnd_SmokeRed_Grenade_shell",4,1],["1Rnd_SmokeBlue_Grenade_shell",4,1],["SmokeShell",4,1],["SmokeShellBlue",2,1],["SmokeShellRed",2,1]]],"H_HelmetIA_net","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_Mk20C_F","","acc_flashlight","optic_Aco",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACRE_PRC343_ID_15",1],["ACRE_PRC148_ID_3",1],["ACRE_PRC152",1],["ACE_bloodIV",1],["ACE_bloodIV_500",1]]],["V_PlateCarrierIA1_dgtl",[["ACE_bloodIV",3],["ACE_bloodIV_500",1],["SmokeShell",4,1],["30Rnd_556x45_Stanag",5,30],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["9Rnd_45ACP_Mag",2,8]]],["B_Kitbag_rgr",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",3],["ACE_adenosine",5],["ACE_bloodIV",5],["ACE_splint",20],["ACE_tourniquet",10],["FSGm_ItemMedicBagMil",1],["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetIA_net","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Autorifleman Loadout

_baseLoadout = [["LMG_Mk200_black_F","","acc_flashlight","optic_Holosight_khk_F",["200Rnd_65x39_cased_Box",200],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",1],["ACE_packingBandage",3],["ACE_salineIV_500",1],["ACRE_PRC343_ID_18",1],["ACE_splint",2],["ACE_tourniquet",2],["9Rnd_45ACP_Mag",2,8]]],["V_PlateCarrierIA1_dgtl",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["SmokeShell",2,1],["200Rnd_65x39_cased_Box_Tracer",2,200]]],["B_Kitbag_rgr",[["HandGrenade",2,1],["200Rnd_65x39_cased_Box",4,200]]],"H_HelmetIA_net","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_Mk20_F","","acc_flashlight","optic_MRCO",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACRE_PRC343_ID_15",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["9Rnd_45ACP_Mag",1,8]]],["V_PlateCarrierIA1_dgtl",[["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_556x45_Stanag_Tracer_Yellow",5,30],["30Rnd_556x45_Stanag",5,30]]],["B_TacticalPack_oli",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["200Rnd_65x39_cased_Box",3,200],["200Rnd_65x39_cased_Box_Tracer",1,200]]],"H_HelmetIA_net","G_Lowprofile",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [["arifle_Mk20C_F","","acc_flashlight","optic_Aco",["30Rnd_556x45_Stanag",30],[],""],["ACE_launch_NLAW_ready_F","","","",["NLAW_F",1],[],""],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACRE_PRC343_ID_18",1],["ACE_tourniquet",2],["ACE_splint",2],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["9Rnd_45ACP_Mag",1,8]]],["V_PlateCarrierIA1_dgtl",[["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["30Rnd_556x45_Stanag",8,30]]],["B_AssaultPack_dgtl",[["ACE_salineIV",1]]],"H_HelmetIA_net","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["srifle_EBR_F","","acc_flashlight","optic_DMS",["20Rnd_762x51_Mag",20],[],"bipod_03_F_blk"],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_I_CombatUniform_shortsleeve",[["ACE_elasticBandage",3],["ACE_epinephrine",1],["ACE_morphine",2],["ACE_packingBandage",3],["ACE_RangeCard",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_splint",2],["ACE_tourniquet",2],["ACRE_PRC343_ID_15",1],["9Rnd_45ACP_Mag",1,8]]],["V_PlateCarrierIA1_dgtl",[["ACRE_PRC343_ID_31",1],["SmokeShell",4,1],["20Rnd_762x51_Mag",6,20]]],["B_AssaultPack_dgtl",[["ACE_salineIV",1],["HandGrenade",2,1],["ACE_20Rnd_762x51_Mag_Tracer",6,20]]],"H_HelmetIA_net","G_Lowprofile",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["hgun_PDW2000_F","","","optic_Aco_smg",["30Rnd_9x21_Mag",30],[],""],[],[],["U_I_HeliPilotCoveralls",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_18",1],["ACRE_PRC148_ID_4",1],["ACE_splint",2],["ACRE_PRC152_ID_1",1]]],["V_Chestrig_khk",[["SmokeShell",4,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["30Rnd_9x21_Mag",5,30]]],["B_FieldPack_khk",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_I","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,5);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);

ADD_ITEMS_TO_CRATE(small,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(small,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(small,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(small,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(small,30);
ADD_SPLINTS_TO_CRATE(small,15);
ADD_MEDS_TO_CRATE(small,20);
ADD_BLOOD_TO_CRATE(small,6);

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
ADD_RIFLE_AMMO_TO_CRATE(med,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,10);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,8);

ADD_ITEMS_TO_CRATE(med,"30Rnd_556x45_Stanag_Tracer_Yellow",10);
ADD_ITEMS_TO_CRATE(med,"ACE_20Rnd_762x51_Mag_Tracer",6);
ADD_ITEMS_TO_CRATE(med,"200Rnd_65x39_cased_Box_Tracer",3);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",5);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",5);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",8);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",1);

ADD_BANDAGES_TO_CRATE(med,60);
ADD_SPLINTS_TO_CRATE(med,30);
ADD_MEDS_TO_CRATE(med,40);
ADD_BLOOD_TO_CRATE(med,12);

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
