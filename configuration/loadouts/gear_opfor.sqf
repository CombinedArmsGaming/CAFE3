
#define FACTION opfor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - OPFOR faction.

    Instructions on how to use this file can be found in the "gearscript_readme.txt" file.
    Commands are described in the "gearscript_readme.txt" file.  They are repeated here without the descriptions for your convenience.

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

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_splint",2],["ACE_tourniquet",2],["ACRE_PRC343_ID_18",1],["16Rnd_9x21_Mag",1,17]]],["V_HarnessO_brn",[["30Rnd_65x39_caseless_green",8,30],["HandGrenade",4,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30]]],["B_AssaultPack_ocamo",[["ACE_EntrenchingTool",1],["ACE_salineIV",1]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(rif,_baseLoadout);


// Commander Loadout

_baseLoadout = [["arifle_Katiba_C_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_OfficerUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACRE_PRC152",1],["ACRE_PRC148",1],["ACE_splint",2],["ACE_tourniquet",2]]],["V_TacVest_khk",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["SmokeShell",2,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["16Rnd_9x21_Mag",1,17],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["30Rnd_65x39_caseless_green",5,30]]],["B_AssaultPack_ocamo",[["NVGoggles",1]]],"H_MilCap_ocamo","G_Aviator",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_Katiba_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_green",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_18",1],["ACRE_PRC148_ID_4",1],["ACE_splint",2],["ACE_tourniquet",2],["16Rnd_9x21_Mag",1,17]]],["V_HarnessOGL_brn",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",1,1],["30Rnd_65x39_caseless_green",5,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["1Rnd_HE_Grenade_shell",9,1]]],["B_AssaultPack_ocamo",[["1Rnd_Smoke_Grenade_shell",6,1],["1Rnd_SmokeRed_Grenade_shell",4,1],["1Rnd_SmokeBlue_Grenade_shell",4,1],["SmokeShellRed",2,1],["SmokeShellBlue",2,1],["SmokeShell",4,1],["1Rnd_HE_Grenade_shell",15,1],["HandGrenade",1,1]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_Katiba_C_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_bloodIV",1],["ACE_bloodIV_500",1],["ACRE_PRC343_ID_18",1],["ACRE_PRC152_ID_1",1],["ACRE_PRC148_ID_4",1]]],["V_HarnessO_brn",[["ACE_bloodIV",4],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_green",5,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["16Rnd_9x21_Mag",1,17]]],["B_Kitbag_cbr",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",3],["ACE_adenosine",5],["ACE_bloodIV",5],["ACE_splint",20],["ACE_tourniquet",10],["FSGm_ItemMedicBagMil",1],["ACE_personalAidKit",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Combat Lifeasser Loadout

_baseLoadout = [["arifle_Katiba_C_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_bloodIV",1],["ACE_bloodIV_500",1],["ACRE_PRC343_ID_18",1],["ACRE_PRC152_ID_1",1],["ACRE_PRC148_ID_4",1]]],["V_HarnessO_brn",[["ACE_bloodIV",4],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_green",5,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["16Rnd_9x21_Mag",1,17]]],["B_Kitbag_cbr",[["ACE_morphine",15],["ACE_epinephrine",10],["ACE_fieldDressing",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_bloodIV_500",5],["ACE_adenosine",5],["ACE_bloodIV",8],["ACE_splint",20],["ACE_tourniquet",10],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [["LMG_Zafir_F","","acc_flashlight","optic_Aco",["150Rnd_762x54_Box",150],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_15",1],["ACE_splint",2],["ACE_tourniquet",2],["16Rnd_9x21_Mag",1,17]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["150Rnd_762x54_Box",2,150]]],["B_Kitbag_cbr",[["ACE_SpareBarrel",1,1],["150Rnd_762x54_Box_Tracer",2,150],["150Rnd_762x54_Box",1,150]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Arco_blk_F",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACRE_PRC343_ID_18",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_EntrenchingTool",1],["16Rnd_9x21_Mag",1,17]]],["V_HarnessO_brn",[["ACE_salineIV",1],["30Rnd_65x39_caseless_green",6,30],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",6,30]]],["B_FieldPack_ocamo",[["150Rnd_762x54_Box_Tracer",1,150],["150Rnd_762x54_Box",3,150]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],["launch_RPG32_F","","","",["RPG32_F",1],[],""],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_EntrenchingTool",1],["ACRE_PRC343_ID_15",1],["16Rnd_9x21_Mag",1,17]]],["V_HarnessO_brn",[["ACE_salineIV",1],["30Rnd_65x39_caseless_green",8,30],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30]]],["B_Kitbag_cbr",[["RPG32_F",2,1],["RPG32_HE_F",2,1]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["srifle_DMR_01_F","","acc_flashlight","optic_SOS",["10Rnd_762x54_Mag",10],[],"bipod_02_F_hex"],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_RangeCard",1],["ACRE_PRC343_ID_18",1],["ACE_splint",2],["ACE_tourniquet",2],["ACE_salineIV",1]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",4,1],["10Rnd_762x54_Mag",12,10],["16Rnd_9x21_Mag",2,17]]],["B_AssaultPack_ocamo",[["ACE_10Rnd_762x54_Tracer_mag",12,10]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadioAcreFlagged","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_02_F","","","optic_Aco_smg",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_morphine",2],["ACE_epinephrine",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC343_ID_15",1],["ACRE_PRC148_ID_5",1],["ACRE_PRC152",1],["ACE_splint",2]]],["V_BandollierB_cbr",[["SmokeShell",4,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["30Rnd_9x21_Mag",4,30]]],["B_AssaultPack_ocamo",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_O","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(crew,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [["arifle_Katiba_C_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_bloodIV",1],["ACE_bloodIV_500",1],["ACRE_PRC343_ID_18",1],["ACRE_PRC152_ID_1",1],["ACRE_PRC148_ID_4",1]]],["V_HarnessO_brn",[["ACE_bloodIV",4],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_green",5,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_ocamo",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(eng,_baseLoadout);


// Small crate loadout
CREATE_CRATE(small);

ADD_RIFLE_TO_CRATE(small,rif,2);
ADD_LAUNCHER_AMMO_TO_CRATE(small,lat,2);
ADD_PISTOL_TO_CRATE(small,rif,2);

ADD_PISTOL_AMMO_TO_CRATE(small,rif,8);
ADD_RIFLE_AMMO_TO_CRATE(small,rif,40);
ADD_RIFLE_AMMO_TO_CRATE(small,ar,8);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,12);
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,15);

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_green_mag_Tracer",15);
ADD_ITEMS_TO_CRATE(small,"ACE_10Rnd_762x54_Tracer_mag",12);
ADD_ITEMS_TO_CRATE(small,"150Rnd_762x54_Box_Tracer",4);

ADD_ITEMS_TO_CRATE(small,"1Rnd_HE_Grenade_shell",15);
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
ADD_RIFLE_AMMO_TO_CRATE(med,mk,24);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,30);

ADD_ITEMS_TO_CRATE(med,"30Rnd_65x39_caseless_green_mag_Tracer",20);
ADD_ITEMS_TO_CRATE(med,"ACE_10Rnd_762x54_Tracer_mag",24);
ADD_ITEMS_TO_CRATE(med,"150Rnd_762x54_Box_Tracer",6);

ADD_ITEMS_TO_CRATE(med,"1Rnd_Smoke_Grenade_shell",20);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeRed_Grenade_shell",10);
ADD_ITEMS_TO_CRATE(med,"1Rnd_SmokeBlue_Grenade_shell",10);

ADD_ITEMS_TO_CRATE(med,"SmokeShellRed",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShellBlue",6);
ADD_ITEMS_TO_CRATE(med,"SmokeShell",15);

ADD_ITEMS_TO_CRATE(med,"HandGrenade",15);
ADD_ITEMS_TO_CRATE(med,"ACE_SpareBarrel",25);

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
