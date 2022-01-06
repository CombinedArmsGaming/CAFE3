
#define FACTION guerrilla

BEGIN_LOADOUTS;


/*

    Gearscript configuration - GUERRILLA faction.

    Instructions on how to use this file can be found in the "gearscript_readme.txt" file.
    Commands are described in the "gearscript_readme.txt" file.  They are repeated here without the descriptions for your convenience.

    To use Guerrilla loadouts ingame, use the "*_g_f" faction codes. (For example, "blu_g_f", "opf_g_f", "ind_g_f").

    -------------------------------------------------

    Available commands FOR UNIT LOADOUTS:

    CREATE_LOADOUT(UNIT_NAME,<ACE Arsenal code>);
    COPY_LOADOUT(TO,FROM);

    ADD_HAT(UNIT_NAME,"Hat Classname");
    ADD_UNIFORM(UNIT_NAME,"Uniform Classname");
    ADD_VEST(UNIT_NAME,"Vest Classname");
    ADD_BACKPACK(UNIT_NAME,"Backpack Classname");

    COPY_ADDONS(TO,FROM);

    CLEAR_HATS(UNIT_NAME);
    CLEAR_UNIFORM(UNIT_NAME);
    CLEAR_VEST(UNIT_NAME);
    CLEAR_BACKPACK(UNIT_NAME);

    CLEAR_ADDONS(UNIT_NAME);

    ADD_VARIANT(UNIT_NAME,<ACE Arsenal code>);

    -------------------------------------------------

    Available commands for editing UNIT LOADOUTS:
    (These commands can cause OVERLOADED LOADOUTS)

    ADD_ITEM_TO_UNIFORM(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_UNIFORM(UNIT_NAME,"Item Name",AMOUNT);

    ADD_ITEM_TO_VEST(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_VEST(UNIT_NAME,"Item Name",AMOUNT);

    ADD_ITEM_TO_BACKPACK(UNIT_NAME,"Item Name");
    ADD_ITEMS_TO_BACKPACK(UNIT_NAME,"Item Name",AMOUNT);

    REMOVE_ITEM_FROM_LOADOUT(UNIT_NAME,"Item Name");

    ADD_MAP(UNIT_NAME);
    REMOVE_MAP(UNIT_NAME);

    ADD_GPS(UNIT_NAME);
    ADD_TERMINAL(UNIT_NAME,"Item Name");
    REMOVE_TERMINAL(UNIT_NAME);

    ADD_COMPASS(UNIT_NAME);
    REMOVE_COMPASS(UNIT_NAME);

    ADD_WATCH(UNIT_NAME);
    ADD_WATCH_ITEM(UNIT_NAME,"Item Name");
    REMOVE_WATCH(UNIT_NAME);

    ADD_NVG(UNIT_NAME,"Item Name");
    REMOVE_NVG(UNIT_NAME);
    
    -------------------------------------------------

    Available commands FOR RE-SUPPLY CRATES:

    CREATE_CRATE(NAME);

    ADD_ITEMS_TO_CRATE(CRATE,"Item Name",AMOUNT);

    ADD_RIFLE_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_RIFLE_GRENADES_TO_CRATE(CRATE,NAME,AMOUNT);

    ADD_PISTOL_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_PISTOL_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_LAUNCHER_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
    ADD_LAUNCHER_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    ADD_BANDAGES_TO_CRATE(CRATE,AMOUNT);
    ADD_SPLINTS_TO_CRATE(CRATE,AMOUNT);
    ADD_MEDS_TO_CRATE(CRATE,AMOUNT);
    ADD_BLOOD_TO_CRATE(CRATE,AMOUNT);

    ADD_BACKPACKS_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);

    FINALIZE_CRATE(NAME);

    -------------------------------------------------

    INFO: All lines should end with a semi-colon (;).  When copy-pasting and adding new commands, make sure you do not accidentally delete or forget to add semi-colons.
    For examples on how to use the gearscript system, see the "gear_blufor.sqf" file for a default "NATO 2035" loadout.  There are extra details in that file to explain things.

*/


// Rifleman Loadout

_baseLoadout = [["arifle_TRG21_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACE_tourniquet",2],["ACE_packingBandage",3],["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_Flashlight_XL50",1],["ACRE_PRC343_ID_1",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",7,30]]],["B_AssaultPack_rgr",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["30Rnd_556x45_Stanag_Tracer_Red",4,30],["HandGrenade",2,1],["SmokeShell",2,1]]],"H_Shemag_olive","",[],["ItemMap","","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]];

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

ADD_VEST(rif,"V_TacVest_oli");
ADD_VEST(rif,"V_TacVest_khk");
ADD_VEST(rif,"V_TacVest_camo");
ADD_VEST(rif,"V_TacVest_brn");
ADD_VEST(rif,"V_TacVest_blk");

// Commander Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_leader",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACE_splint",2],["ACRE_PRC152_ID_1",1],["ACRE_PRC148",1]]],["V_BandollierB_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",1,8],["30Rnd_556x45_Stanag_Tracer_Yellow",5,30],["SmokeShellRed",2,1],["SmokeShellBlue",2,1]]],[],"H_MilCap_mcamo","",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_TRG21_GL_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_leader",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACRE_PRC148_ID_3",1],["ACE_splint",2],["ACRE_PRC152_ID_1",1]]],["V_Chestrig_oli",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag",6,30],["30Rnd_556x45_Stanag_Tracer_Yellow",4,30],["HandGrenade",2,1]]],["B_TacticalPack_oli",[["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["1Rnd_HE_Grenade_shell",15,1],["1Rnd_SmokeRed_Grenade_shell",5,1],["1Rnd_SmokeBlue_Grenade_shell",5,1],["ACE_40mm_Flare_red",5,1],["ACE_40mm_Flare_green",5,1]]],"H_Booniehat_khk_hs","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343_ID_18",1],["ACRE_PRC152",1],["ACRE_PRC148",1],["ACE_bloodIV_500",1]]],["V_TacVest_oli",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_bloodIV",2],["ACE_bloodIV_500",1],["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",5,30]]],["B_Kitbag_rgr",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",3],["ACE_adenosine",5],["ACE_bloodIV",5],["ACE_splint",20],["ACE_tourniquet",10],["FSGm_ItemMedicBagMil",1],["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1]]],"H_Shemag_olive","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Combat Lifesaver Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343_ID_18",1],["ACRE_PRC152",1],["ACRE_PRC148",1],["ACE_bloodIV_500",1]]],["V_TacVest_oli",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_bloodIV",2],["ACE_bloodIV_500",1],["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",5,30]]],["B_Kitbag_rgr",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_adenosine",5],["ACE_bloodIV",8],["ACE_splint",20],["ACE_tourniquet",10],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_bloodIV_500",5]]],"H_Shemag_olive","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [["LMG_Mk200_F","","acc_flashlight","optic_Holosight",["200Rnd_65x39_cased_Box",200],[],"bipod_01_F_snd"],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACE_splint",2],["SmokeShell",2,1]]],["V_TacVest_oli",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",2,1],["9Rnd_45ACP_Mag",2,8],["200Rnd_65x39_cased_Box",1,200]]],["B_TacticalPack_rgr",[["200Rnd_65x39_cased_Box_Tracer",2,200],["ACE_SpareBarrel",1,1],["200Rnd_65x39_cased_Box",1,200]]],"H_Shemag_olive","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_TRG21_F","","acc_flashlight","optic_MRCO",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343_ID_18",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",4,30],["30Rnd_556x45_Stanag",3,30]]],["B_FieldPack_oli",[["ACE_EntrenchingTool",1],["200Rnd_65x39_cased_Box_Tracer",1,200],["200Rnd_65x39_cased_Box",2,200],["30Rnd_556x45_Stanag",2,30],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30]]],"H_Shemag_olive","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,med);


// Light anti-tank Loadout

_baseLoadout = [["arifle_TRG21_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],["launch_RPG7_F","","","",["RPG7_F",1],[],""],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_splint",2]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",2,30],["30Rnd_556x45_Stanag",5,30]]],["B_AssaultPack_rgr",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["RPG7_F",3,1],["30Rnd_556x45_Stanag",2,30]]],"H_Shemag_olive","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["srifle_EBR_F","","acc_flashlight","optic_DMS",["20Rnd_762x51_Mag",20],[],"bipod_03_F_blk"],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_RangeCard",1],["ACRE_PRC343_ID_18",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1]]],["V_TacVest_oli",[["HandGrenade",2,1],["SmokeShell",2,1],["9Rnd_45ACP_Mag",2,8],["20Rnd_762x51_Mag",5,20]]],["B_AssaultPack_rgr",[["HandGrenade",2,1],["ACE_20Rnd_762x51_Mag_Tracer",6,20]]],"H_Shemag_olive","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_02_F","","acc_flashlight","optic_ACO_grn_smg",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_C_WorkerCoveralls",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACRE_PRC148_ID_2",1],["ACRE_PRC343_ID_15",1],["ACRE_PRC152_ID_1",1]]],["V_BandollierB_khk",[["ACE_epinephrine",1],["ACE_morphine",1],["SmokeShell",4,1],["30Rnd_9x21_Mag_SMG_02",4,30]]],["B_AssaultPack_rgr",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_I","",[],["ItemMap","ItemGPS","ItemRadioAcreFlagged","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(crew,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [["arifle_TRG20_F","","acc_flashlight","optic_ACO_grn",["30Rnd_556x45_Stanag",30],[],""],[],["hgun_ACPC2_F","","","",["9Rnd_45ACP_Mag",8],[],""],["U_BG_Guerilla1_1",[["ACRE_PRC343_ID_18",1],["ACRE_PRC152",1],["ACRE_PRC148",1],["ACE_bloodIV_500",1]]],["V_TacVest_oli",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_bloodIV",2],["ACE_bloodIV_500",1],["SmokeShell",4,1],["9Rnd_45ACP_Mag",2,8],["30Rnd_556x45_Stanag_Tracer_Yellow",5,30]]],["B_AssaultPack_khk",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_Bandanna_sgg","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(eng,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,6);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,30);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,6);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);

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

ADD_BANDAGES_TO_CRATE(small,40);
ADD_SPLINTS_TO_CRATE(small,30);
ADD_MEDS_TO_CRATE(small,30);
ADD_BLOOD_TO_CRATE(small,15);

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
ADD_RIFLE_AMMO_TO_CRATE(med,ar,12);
ADD_RIFLE_AMMO_TO_CRATE(med,mk,15);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);

ADD_ITEMS_TO_CRATE(med,"30Rnd_556x45_Stanag_Tracer_Yellow",20);
ADD_ITEMS_TO_CRATE(med,"ACE_20Rnd_762x51_Mag_Tracer",15);
ADD_ITEMS_TO_CRATE(med,"200Rnd_65x39_cased_Box_Tracer",6);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",20);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",10);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",2);

ADD_BANDAGES_TO_CRATE(med,80);
ADD_SPLINTS_TO_CRATE(med,40);
ADD_MEDS_TO_CRATE(med,50);
ADD_BLOOD_TO_CRATE(med,30);

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
