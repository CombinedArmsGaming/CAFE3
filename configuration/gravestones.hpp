/*

    Gravestone corpse-manager - configuration.

    This is an alternative corpse manager which allows the creation of 'gravestones' for corpses after they have been deleted.
    These gravestones contain the corpse's items and weapons, allowing players to loot items after the corpse is gone (radios, launchers...)

    This corpse manager can also be used with the gravestones disabled.  In this mode, it has the benefit of deleting unimportant corpses before important ones.
    'Important corpses' are defined as player corpses and manually exempted corpses.  Player corpses will only be deleted when there is no other choice, and exempted ones will never be deleted.

    You can exempt a unit from the corpse manager by putting this code into its 'init' line (in the mission editor):

        [this, false] call f_fnc_allowGravestone;

*/


// Enables the gravestone corpse-manager.
// When disabled, the default Arma 3 corpse manager will be used instead.
// To disable the gravestone corpse-manager, comment-out or delete the line below INSTEAD of setting it to 0.
#define ENABLE_GRAVESTONE_CORPSE_MANAGER 1

// Enables the gravestones for old corpses.
// To disable gravestones, comment-out or delete the line below INSTEAD of setting it to 0.
#define ENABLE_GRAVESTONES 1

// Enable a priority list for important corpses (such as players).  These corpses will only be removed when there is no other choice.
// To disable the priority list, comment-out or delete the line below INSTEAD of setting it to 0.
#define GRAVESTONES_USE_PRIORITY_LIST 1

// Enables gravestones only for important corpses (such as players).  Deletion rules remain the same for other corpses, but they will not receive a gravestone.
// To allow gravestones for all units, comment-out or delete the line below INSTEAD of setting it to 0.
//#define GRAVESTONES_ALLOW_PRIORITY_ONLY 1

// The amount of corpses which can exist before gravestones start to appear.
#define MAX_CORPSES_BEFORE_GRAVESTONES 20

// The normal amount of time a corpse will lie around before being gravestoned.
#define GRAVESTONE_CORPSE_TIMEOUT 60

// The amount of corpses which can exist before the normal corpse 'lifetime' will be ignored.
// After this amount is reached, corpses are immediately deleted until the amount returns below this value again.
#define MAX_CORPSES_PANIC_MODE 30

// The timestep at which the grave manager runs.  May improve performance when increased if lots of corpses exist at a time.
#define GRAVESTONE_MANAGER_INTERVAL 5
