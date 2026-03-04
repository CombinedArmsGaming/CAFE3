
#define FACTION blufor

BEGIN_LOADOUTS;


/*

    Gearscript configuration - BLUFOR faction.

    Instructions on how to use this file can be found in the "gearscript_readme.txt" file.
    Commands are described in the "gearscript_readme.txt" file.  They are repeated here without the descriptions for your convenience.

    -------------------------------------------------

    Available commands FOR UNIT LOADOUTS:

    CREATE_LOADOUT(UNIT_NAME,<ACE Arsenal code> OR <unit class-name>);
    COPY_LOADOUT(TO,FROM);

    ADD_HAT(UNIT_NAME,"Hat Classname");
    ADD_UNIFORM(UNIT_NAME,"Uniform Classname");
    ADD_VEST(UNIT_NAME,"Vest Classname");
    ADD_BACKPACK(UNIT_NAME,"Backpack Classname");
    ADD_FACEWEAR(UNIT_NAME,"Facewear Classname");

    FORCE_FACEWEAR(UNIT_NAME);

    COPY_ADDONS(TO,FROM);

    COPY_HATS(TO,FROM);
    COPY_UNIFORMS(TO,FROM);
    COPY_VESTS(TO,FROM);
    COPY_BACKPACKS(TO,FROM);
    COPY_FACEWEAR(TO,FROM);

    CLEAR_HATS(UNIT_NAME);
    CLEAR_UNIFORM(UNIT_NAME);
    CLEAR_VEST(UNIT_NAME);
    CLEAR_BACKPACK(UNIT_NAME);
    CLEAR_FACEWEAR(UNIT_NAME);

    CLEAR_ADDONS(UNIT_NAME);

    ADD_VARIANT(UNIT_NAME,<ACE Arsenal code> OR <unit class-name>);

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

    PUT_GUN_IN_GUNBAG(UNIT_NAME,FULL ACE ARSENAL EXPORT);

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
    For examples on how to use the gearscript system, see below for a default "NATO 2035" loadout.  There are extra details in comments below to explain things.

*/



// Rifleman Loadout

_baseLoadout = [[["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],[],[],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier2_rgr",[["HandGrenade",2,1],["30Rnd_65x39_caseless_mag_Tracer",3,30],["30Rnd_65x39_caseless_mag",7,30],["SmokeShell",2,1]]],["B_AssaultPack_rgr",[["30Rnd_65x39_caseless_mag_Tracer",2,30]]],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(rif,_baseLoadout);   // Riflemen will now have the loadout from the line above.

ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");  // Add a random uniform or t-shirt.
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam");  // Units are twice as likely to have a uniform than a t-shirt because this line has been copied.
ADD_UNIFORM(rif,"U_B_CombatUniform_mcam_tshirt");

ADD_HAT(rif,"H_HelmetB_snakeskin"); // Add a random helmet to all riflemen.
ADD_HAT(rif,"H_HelmetB_grass");
ADD_HAT(rif,"H_HelmetB");


// Commander Loadout

_baseLoadout = [[["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",2,17]]],["B_AssaultPack_khk",[["SmokeShell",2,1]]],"H_MilCap_mcamo","",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(co,_baseLoadout);


// Forward Air Controller Loadout

_baseLoadout = [[["arifle_MX_GL_F","","acc_pointer_IR","optic_Holosight",["30Rnd_65x39_caseless_mag",30],["3Rnd_HE_Grenade_shell",3],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",2,17],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30]]],["B_AssaultPack_khk",[["3Rnd_HE_Grenade_shell",2,3],["3Rnd_Smoke_Grenade_shell",2,3],["3Rnd_SmokeBlue_Grenade_shell",2,3],["3Rnd_SmokeRed_Grenade_shell",4,3],["3Rnd_UGL_FlareRed_F",1,3],["3Rnd_UGL_FlareCIR_F",1,3]]],"H_MilCap_mcamo","G_Tactical_Clear",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(fac,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [[["arifle_MX_GL_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],["3Rnd_HE_Grenade_shell",3],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrierGL_mtp",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["HandGrenade",2,1],["SmokeShell",3,1],["30Rnd_65x39_caseless_mag_Tracer",3,30],["30Rnd_65x39_caseless_mag",6,30],["16Rnd_9x21_Mag",2,17]]],["B_AssaultPack_rgr",[["3Rnd_HE_Grenade_shell",4,3],["3Rnd_Smoke_Grenade_shell",3,3],["3Rnd_SmokeRed_Grenade_shell",2,3],["3Rnd_SmokeBlue_Grenade_shell",2,3],["SmokeShellRed",1,1],["SmokeShellBlue",2,1],["SmokeShell",1,1]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);   // FTLs will now get the random uniforms and hats from the Rifleman class.


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);   // SLs will be identical to FTLs.  Because FTLs get the random Rifleman stuff, SLs will get it too.


// Surgeon Loadout (Has PAK)

_baseLoadout = [[["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",1,1],["SmokeShell",10,1],["30Rnd_65x39_caseless_green",6,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["16Rnd_9x21_Mag",2,17]]],["B_Carryall_khk",[["ACE_morphine",10],["ACE_epinephrine",10],["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_adenosine",5],["ACE_splint",10],["ACE_tourniquet",8],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_quikclot",5],["ACE_personalAidKit",1],["ACE_bloodIV",8],["ACE_bloodIV_500",8]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(sur,_baseLoadout);
COPY_ADDONS(sur,rif);


// Medic Loadout (No PAK)

_baseLoadout = [[["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_packingBandage",1],["ACE_fieldDressing",5],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_quikclot",1],["ACE_Canteen",1],["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",1,1],["SmokeShell",10,1],["30Rnd_65x39_caseless_green",6,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["16Rnd_9x21_Mag",2,17]]],["B_Carryall_khk",[["ACE_morphine",8],["ACE_epinephrine",8],["ACE_packingBandage",15],["ACE_elasticBandage",25],["ACE_adenosine",5],["ACE_splint",6],["ACE_tourniquet",6],["FSGm_ItemMedicBag",1],["ACE_surgicalKit",1],["ACE_EntrenchingTool",1],["ACE_quikclot",5],["ACE_salineIV",8],["ACE_salineIV_500",8],["ACE_fieldDressing",10],["SmokeShell",4,1]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Combat Lifefacer Loadout

_baseLoadout = [[["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],[],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",4,1]]],["B_AssaultPack_khk",[["ACE_morphine",4],["ACE_epinephrine",4],["ACE_packingBandage",10],["ACE_elasticBandage",10],["ACE_adenosine",2],["ACE_splint",4],["ACE_tourniquet",4],["ACE_surgicalKit",1],["ACE_quikclot",5],["ACE_salineIV_500",4],["ACE_salineIV",4],["SmokeShell",4,1]]],"H_HelmetB_snakeskin","",[],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(cls,_baseLoadout);
COPY_ADDONS(cls,rif);


// Autorifleman Loadout

_baseLoadout = [[["arifle_MX_SW_F","","acc_flashlight","optic_MRCO",["100Rnd_65x39_caseless_mag",100],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["100Rnd_65x39_caseless_mag",3,100],["100Rnd_65x39_caseless_mag_Tracer",1,100],["SmokeShell",2,1],["16Rnd_9x21_Mag",2,17]]],["B_AssaultPack_rgr",[["ACE_SpareBarrel",1,1],["100Rnd_65x39_caseless_mag",3,100],["100Rnd_65x39_caseless_mag_Tracer",2,100]]],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [[["arifle_MX_F","","acc_flashlight","optic_Hamr",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],[],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier2_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",6,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShell",2,1]]],["B_Kitbag_mcamo",[["ACE_EntrenchingTool",1],["ACE_salineIV",1],["100Rnd_65x39_caseless_mag",6,100],["100Rnd_65x39_caseless_mag_Tracer",3,100]]],"H_HelmetB_snakeskin","",["Binocular","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [[["arifle_MX_F","","acc_flashlight","optic_Holosight",["30Rnd_65x39_caseless_mag",30],[],""],["launch_NLAW_F","","","",[],[],""],[],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",3,1],["30Rnd_65x39_caseless_mag_Tracer",2,30],["30Rnd_65x39_caseless_mag",8,30],["SmokeShell",2,1]]],["B_AssaultPack_rgr",[]],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [[["arifle_MXM_F","","acc_flashlight","optic_SOS",["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_snd"],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_mag",6,30],["30Rnd_65x39_caseless_mag_Tracer",2,30],["16Rnd_9x21_Mag",3,17]]],["B_AssaultPack_rgr",[["30Rnd_65x39_caseless_mag",4,30]]],"H_HelmetB_snakeskin","",[],["ItemMap","","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Sniper Loadout

_baseLoadout = [["srifle_LRR_F","","","optic_LRPS",["7Rnd_408_Mag",7],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_TacChestrig_oli_F",[["optic_NVS",1],["HandGrenade",2,1],["SmokeShell",4,1],["7Rnd_408_Mag",6,7],["16Rnd_9x21_Mag",1,17]]],["ace_gunbag_Tan",[["30Rnd_65x39_caseless_mag",3,30],["30Rnd_65x39_caseless_mag_Tracer",1,30],["NVGoggles",1]]],"H_Booniehat_mcamo","",["ACE_Vector","","","",[],[],""],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(sniper,_baseLoadout);

// This must be a full ACE Arsenal export.  Not just the part with the weapon.
_gunbagLoadout = [["arifle_MXC_F","muzzle_snds_65_TI_blk_F","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_mag",30],[],""],[],[],[],[],[],"","",[],["","","","","",""]];

PUT_GUN_IN_GUNBAG(sniper,_gunbagLoadout);


// Crewman Loadout

_baseLoadout = [[["SMG_01_F","","acc_flashlight_smg_01","optic_ACO_grn_smg",["30Rnd_45ACP_Mag_SMG_01",25],[],""],[],[],["U_B_HeliPilotCoveralls",[["ACE_elasticBandage",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_splint",1],["ACE_tourniquet",2],["ACE_salineIV",1],["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_Chestrig_oli",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["SmokeShell",4,1],["30Rnd_45ACP_Mag_SMG_01",6,25],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["SmokeShellGreen",2,1]]],["B_FieldPack_oli",[["ToolKit",1],["ACE_EntrenchingTool",1]]],"H_HelmetCrew_B","G_Combat",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]],[]];

CREATE_LOADOUT(crew,_baseLoadout);


// Engineer/logi Loadout

_baseLoadout = [[["arifle_MXC_F","","acc_flashlight","optic_ACO_grn",["30Rnd_65x39_caseless_mag",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACE_Canteen",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["ACE_fieldDressing",5],["ACE_packingBandage",1],["ACE_quikclot",1],["ACE_salineIV",1],["ACE_tourniquet",2],["ACE_splint",1],["ACRE_PRC343",1],["ACE_painkillers",2,10]]],["V_PlateCarrier1_rgr",[["ACE_MapTools",1],["ACE_Flashlight_XL50",1],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_mag_Tracer",4,30],["30Rnd_65x39_caseless_mag",4,30],["SmokeShellBlue",2,1],["SmokeShellRed",2,1],["16Rnd_9x21_Mag",1,17]]],["B_AssaultPack_khk",[["ToolKit",1],["ACE_EntrenchingTool",1],["ACE_Clacker",1],["MineDetector",1],["ACE_DefusalKit",1],["ACE_wirecutter",1]]],"H_HelmetB","G_Tactical_Clear",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles"]],[]];

CREATE_LOADOUT(eng,_baseLoadout);


// Impostor loadout very suspicious

COPY_LOADOUT(sus,co);
CLEAR_HATS(sus);
ADD_HAT(sus,"H_Cap_brn_SPECOPS");


// Zeus

_baseLoadout = [["arifle_SDAR_F","","","",["30Rnd_556x45_Stanag_Tracer_Red",30],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_B_CombatUniform_mcam",[["ACRE_PRC343_ID_3",1],["ACRE_PRC148",1],["ACRE_PRC152",1],["ACE_Banana",1]]],["V_PlateCarrier1_rgr",[["ACE_Banana",1],["ACE_CableTie",10],["16Rnd_9x21_Mag",2,17],["30Rnd_556x45_Stanag_Tracer_Red",3,30]]],["B_AssaultPack_rgr",[["ACE_Banana",1],["ACE_UAVBattery",1],["ACE_EntrenchingTool",1],["ACE_DefusalKit",1],["ToolKit",1],["ACE_wirecutter",1]]],"H_HelmetCrew_I","",["Laserdesignator","","","",["Laserbatteries",1],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","NVGoggles_INDEP"]];

CREATE_LOADOUT(zeus,_baseLoadout);
COPY_ADDONS(zeus,rif);



// Small crate loadout
CREATE_CRATE(small);  // The name of this crate is "small".  You will need to use this name in all the commands below.
                      // INFO: the name of this crate in-game will be "crate_small".

ADD_RIFLE_TO_CRATE(small,rif,2);    // This crate now contains two of the Rifleman's rifles in it.
ADD_LAUNCHER_TO_CRATE(small,lat,2); // This crate now contains two of the LAT soldier's launchers in it.
ADD_PISTOL_TO_CRATE(small,rif,2);   // Two of the Rifleman's pistols.  If the Rifleman doesn't have a pistol, you can choose it from other units (for example, ftl or co).

ADD_RIFLE_AMMO_TO_CRATE(small,rif,25); // This crate now contains two rifle magazines in it, which the Rifleman can use.
ADD_PISTOL_AMMO_TO_CRATE(small,rif,6); // This crate now contains two of the Rifleman's pistol magazines in it.
ADD_RIFLE_AMMO_TO_CRATE(small,ar,6);   // These commands copy whatever magazine is loaded into the weapon in ACE Arsenal.
ADD_RIFLE_AMMO_TO_CRATE(small,crew,2); // So if nothing appears, make sure your loadout has a magazine loaded into its gun.
ADD_RIFLE_AMMO_TO_CRATE(small,mk,5);
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);  // Grenade launcher rounds work too!

ADD_ITEMS_TO_CRATE(small,"30Rnd_65x39_caseless_mag_Tracer",10); // The Rifleman has normal bullets loaded into his gun.  To add Tracer rounds into this box, we can use this command.
ADD_ITEMS_TO_CRATE(small,"100Rnd_65x39_caseless_mag_Tracer",3);

ADD_ITEMS_TO_CRATE(small,"3Rnd_Smoke_Grenade_shell",4); // The FTL has explosive grenades loaded by default, to add smoke rounds we can use this command.
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeRed_Grenade_shell",2); // If your gearscript uses different ammo, you can select it in ACE Arsenal and use CTRL+C to get the right Classname.
ADD_ITEMS_TO_CRATE(small,"3Rnd_SmokeBlue_Grenade_shell",2); // Then you can use CTRL+V to paste into the quote-marks here.

ADD_ITEMS_TO_CRATE(small,"SmokeShellRed",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShellBlue",2);
ADD_ITEMS_TO_CRATE(small,"SmokeShell",6);

ADD_ITEMS_TO_CRATE(small,"HandGrenade",6);
ADD_ITEMS_TO_CRATE(small,"ACE_SpareBarrel",1);  // to go into battle with a machinegun and not get it red-hot is blasphemous.

ADD_BANDAGES_TO_CRATE(small,40); // This will automatically add a mixture of different bandages into the crate.
ADD_SPLINTS_TO_CRATE(small,20);
ADD_MEDS_TO_CRATE(small,30); // This will automatically add a mixture of different auto-injectors into the crate.
ADD_BLOOD_TO_CRATE(small,15); // This will add eight 1000ml bags of blood.

ADD_BACKPACKS_TO_CRATE(small,rif,2);  // We can also add two of the Rifleman's backpacks in here, in case someone loses theirs or needs to carry extra things.

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
ADD_RIFLE_AMMO_TO_CRATE(med,rif,50);
ADD_RIFLE_AMMO_TO_CRATE(med,ar,15);
ADD_RIFLE_AMMO_TO_CRATE(med,crew,4);
ADD_RIFLE_AMMO_TO_CRATE(small,mk,10);
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
