
// Enables gravestones for old corpses.
// To disable gravestones, comment-out or delete the line below INSTEAD of setting it to 0.
#define ENABLE_GRAVESTONES 1

// Enable a priority list for important corpses (such as players).  These corpses will only be removed when there is no other choice.
// To disable the priority list, comment-out or delete the line below INSTEAD of setting it to 0.
#define GRAVESTONES_USE_PRIORITY_LIST 1

// The amount of corpses which can exist before gravestones start to appear.
#define MAX_CORPSES_BEFORE_GRAVESTONES 20

// The normal amount of time a corpse will lie around before being gravestoned.
#define GRAVESTONE_CORPSE_TIMEOUT 15

// The amount of corpses which can exist before the normal corpse 'lifetime' will be ignored.
#define MAX_CORPSES_PANIC_MODE 30

// The timestep at which the grave manager runs.  May improve performance when increased if lots of corpses exist at a time.
#define GRAVESTONE_MANAGER_INTERVAL 5
