
#define FACTION civilian

BEGIN_LOADOUTS;




// Default loadout.
// If Gearscript tries to use an invalid loadout, it will fall-back to this default loadout instead.

_baseLoadout = [[],[],["hgun_Pistol_Signal_F","","","",["6Rnd_RedSignal_F",6],[],""],["U_C_Poloshirt_burgundy",[["ACE_elasticBandage",2],["ACE_packingBandage",3],["ACE_morphine",1],["ACE_splint",1],["6Rnd_GreenSignal_F",1,6]]],[],[],"H_Cap_red","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

CREATE_LOADOUT(default,_baseLoadout);
