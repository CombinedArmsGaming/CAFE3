
#define FACTION guerrilla

BEGIN_LOADOUTS;




// Rifleman Loadout

_baseLoadout = [["arifle_TRG21_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30]]],["B_AssaultPack_rgr",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30],["30Rnd_556x45_Stanag_Tracer_Red",4,30],["HandGrenade",2,1]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(rif,_baseLoadout);

ADD_UNIFORM(rif,"U_BG_Guerilla1_1");
ADD_UNIFORM(rif,"U_BG_Guerrilla_6_1");
ADD_UNIFORM(rif,"U_BG_Guerilla2_2");
ADD_UNIFORM(rif,"U_BG_Guerilla2_1");
ADD_UNIFORM(rif,"U_BG_Guerilla2_3");

ADD_HAT(rif,"H_Shemag_olive");
ADD_HAT(rif,"H_Bandanna_khk");
ADD_HAT(rif,"H_Bandanna_gry");
ADD_HAT(rif,"H_Watchcap_cbr");
ADD_HAT(rif,"H_ShemagOpen_tan");
ADD_HAT(rif,"H_ShemagOpen_khk");

ADD_BACKPACK(rif,"B_AssaultPack_rgr");
ADD_BACKPACK(rif,"B_AssaultPack_cbr");
ADD_BACKPACK(rif,"B_AssaultPack_khk");

ADD_VEST(rif,"V_TacVest_oli");
ADD_VEST(rif,"V_TacVest_khk");
ADD_VEST(rif,"V_TacVest_camo");
ADD_VEST(rif,"V_TacVest_brn");
ADD_VEST(rif,"V_TacVest_blk");

// Commander Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_leader",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_BandollierB_oli",[["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",6,30]]],[],"H_MilCap_mcamo","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_leader",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACRE_PRC148",1]]],["V_Chestrig_oli",[["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30]]],[],"H_MilCap_mcamo","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_TacVest_oli",[["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30]]],["B_FieldPack_oli",[["ACE_elasticBandage",15],["ACE_fieldDressing",10],["ACE_epinephrine",15],["ACE_morphine",15],["ACE_atropine",5],["ACE_packingBandage",15],["ACE_bloodIV",10],["ACE_30Rnd_556x45_Stanag_Mk318_mag",1,30],["30Rnd_556x45_Stanag_Tracer_Red",2,30]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);

CLEAR_BACKPACKS(med);

ADD_BACKPACK(rif,"B_FieldPack_oli");
ADD_BACKPACK(rif,"B_FieldPack_khk");
ADD_BACKPACK(rif,"B_FieldPack_cbr");
ADD_BACKPACK(rif,"B_TacticalPack_rgr");
ADD_BACKPACK(rif,"B_TacticalPack_blk");
ADD_BACKPACK(rif,"B_TacticalPack_oli");


// Autorifleman Loadout

_baseLoadout = [["LMG_Mk200_F","","acc_flashlight","optic_Holosight",["200Rnd_65x39_cased_Box_Tracer",200],[],"bipod_01_F_snd"],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["200Rnd_65x39_cased_Box",1,200]]],["B_AssaultPack_rgr",[["200Rnd_65x39_cased_Box_Tracer",1,200],["200Rnd_65x39_cased_Box",1,200],["ACE_SpareBarrel",1,1]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30]]],["B_FieldPack_oli",[["ACE_30Rnd_556x45_Stanag_Mk318_mag",1,30],["30Rnd_556x45_Stanag_Tracer_Red",2,30],["200Rnd_65x39_cased_Box_Tracer",1,200],["200Rnd_65x39_cased_Box",2,200]]],"H_Shemag_olive","",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,med);


// Light anti-tank Loadout

_baseLoadout = [["arifle_TRG21_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],["launch_RPG7_F","","","",["RPG7_F",1],[],""],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["ACE_30Rnd_556x45_Stanag_Mk318_mag",7,30]]],["B_AssaultPack_rgr",[["30Rnd_556x45_Stanag_Tracer_Red",2,30],["ACE_30Rnd_556x45_Stanag_Mk318_mag",1,30],["RPG7_F",3,1]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["srifle_EBR_F","","acc_pointer_IR","optic_DMS",["20Rnd_762x51_Mag",20],[],"bipod_03_F_blk"],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_RangeCard",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["20Rnd_762x51_Mag",5,20]]],["B_AssaultPack_rgr",[["HandGrenade",2,1],["ACE_20Rnd_762x51_Mag_Tracer",3,20],["20Rnd_762x51_Mag",2,20]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_02_F","","acc_flashlight","optic_ACO_grn_smg",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_C_WorkerCoveralls",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1]]],["V_BandollierB_khk",[["SmokeShell",4,1],["30Rnd_9x21_Mag_SMG_02",5,30]]],["B_AssaultPack_rgr",[["ToolKit",1]]],"H_HelmetCrew_I","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_AMMO_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,5);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);

ADD_BANDAGES_TO_CRATE(small,30);
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
ADD_LAUNCHER_TO_CRATE(med,lat,1);
ADD_LAUNCHER_AMMO_TO_CRATE(med,lat,4);
ADD_PISTOL_TO_CRATE(med,rif,4);

ADD_PISTOL_AMMO_TO_CRATE(med,rif,12);
ADD_RIFLE_AMMO_TO_CRATE(med,rif,60);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,10);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);

ADD_BANDAGES_TO_CRATE(med,60);
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
