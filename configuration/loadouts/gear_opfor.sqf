
#define FACTION opfor




// Rifleman Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACE_salineIV_500",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["30Rnd_65x39_caseless_green",8,30],["HandGrenade",4,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["ACE_Chemlight_IR",1,1]]],["B_AssaultPack_ocamo",[["30Rnd_65x39_caseless_green",6,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(rif,_baseLoadout);


// Commander Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_OfficerUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACE_salineIV_500",1],["16Rnd_9x21_Mag",2,17]]],["V_TacVest_khk",[["30Rnd_65x39_caseless_green",6,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["SmokeShell",2,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1]]],[],"H_MilCap_ocamo","G_Aviator",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(co,_baseLoadout);


// Fireteam lead Loadout

_baseLoadout = [["arifle_Katiba_GL_F","","acc_pointer_IR","optic_Aco",["30Rnd_65x39_caseless_green",30],["1Rnd_HE_Grenade_shell",1],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["ACE_salineIV_250",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessOGL_brn",[["HandGrenade",1,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["30Rnd_65x39_caseless_green",2,30],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["1Rnd_HE_Grenade_shell",9,1],["SmokeShellRed",1,1],["SmokeShellBlue",1,1]]],["B_AssaultPack_ocamo",[["30Rnd_65x39_caseless_green",5,30],["1Rnd_Smoke_Grenade_shell",6,1],["1Rnd_SmokeRed_Grenade_shell",2,1],["1Rnd_SmokeBlue_Grenade_shell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ftl,_baseLoadout);
COPY_ADDONS(ftl,rif);


// Squad lead Loadout

COPY_LOADOUT(sl,ftl);


// Medic Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["30Rnd_65x39_caseless_green",8,30],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["ACE_Chemlight_IR",1,1]]],["B_FieldPack_ocamo",[["ACE_epinephrine",15],["ACE_morphine",15],["ACE_elasticBandage",15],["ACE_packingBandage",15],["ACE_fieldDressing",10],["ACE_atropine",5],["ACE_bloodIV",10]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(med,_baseLoadout);
COPY_ADDONS(med,rif);


// Autorifleman Loadout

_baseLoadout = [["LMG_Zafir_F","","acc_flashlight","optic_Aco",["150Rnd_762x54_Box_Tracer",150],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACE_salineIV_500",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",2,1],["ACE_Chemlight_IR",1,1],["150Rnd_762x54_Box",2,150]]],["B_AssaultPack_ocamo",[["150Rnd_762x54_Box",2,150],["ACE_SpareBarrel",1,1]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(ar,_baseLoadout);
COPY_ADDONS(ar,rif);


// Assistant AR Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["30Rnd_65x39_caseless_green",8,30],["HandGrenade",2,1],["SmokeShell",4,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["ACE_Chemlight_IR",1,1]]],["B_FieldPack_ocamo",[["150Rnd_762x51_Box",2,150],["150Rnd_762x51_Box_Tracer",1,150],["30Rnd_65x39_caseless_green",5,30]]],"H_HelmetO_ocamo","G_Combat",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(aar,_baseLoadout);
COPY_ADDONS(aar,rif);


// Light anti-tank Loadout

_baseLoadout = [["arifle_Katiba_ACO_pointer_F","","acc_flashlight","optic_Aco",["30Rnd_65x39_caseless_green",30],[],""],["launch_RPG32_F","","","",["RPG32_F",1],[],""],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACE_salineIV_500",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["30Rnd_65x39_caseless_green",8,30],["HandGrenade",2,1],["SmokeShell",2,1],["30Rnd_65x39_caseless_green_mag_Tracer",2,30],["ACE_Chemlight_IR",1,1]]],["B_AssaultPack_ocamo",[["30Rnd_65x39_caseless_green",2,30],["RPG32_F",1,1],["RPG32_HE_F",1,1],["30Rnd_65x39_caseless_green_mag_Tracer",1,30]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(lat,_baseLoadout);
COPY_ADDONS(lat,rif);


// Marksman Loadout

_baseLoadout = [["srifle_DMR_01_F","","acc_pointer_IR","optic_DMS",["10Rnd_762x54_Mag",10],[],"bipod_02_F_hex"],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_O_CombatUniform_ocamo",[["ACE_elasticBandage",3],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACRE_PRC343",1],["ACE_salineIV_500",1],["ACE_RangeCard",1],["16Rnd_9x21_Mag",2,17]]],["V_HarnessO_brn",[["HandGrenade",2,1],["SmokeShell",4,1],["ACE_Chemlight_IR",1,1],["10Rnd_762x54_Mag",10,10],["ACE_10Rnd_762x54_Tracer_mag",5,10]]],["B_AssaultPack_ocamo",[["10Rnd_762x54_Mag",5,10]]],"H_HelmetO_ocamo","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];

CREATE_LOADOUT(mk,_baseLoadout);
COPY_ADDONS(mk,rif);


// Crewman Loadout

_baseLoadout = [["SMG_02_F","","","optic_Aco_smg",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_O_CombatUniform_ocamo",[["ACRE_PRC343",1],["ACE_elasticBandage",3],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_salineIV_500",1],["ACE_packingBandage",3],["ACE_tourniquet",2],["ACRE_PRC148",1]]],["V_BandollierB_cbr",[["SmokeShell",4,1],["ACE_Chemlight_IR",1,1],["SmokeShellBlue",1,1],["SmokeShellRed",1,1],["30Rnd_9x21_Mag",5,30]]],["B_AssaultPack_ocamo",[["ToolKit",1]]],"H_HelmetCrew_O","G_Combat",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];

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
ADD_RIFLE_GRENADES_TO_CRATE(small,ftl,4);

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
ADD_RIFLE_GRENADES_TO_CRATE(med,ftl,8);

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
