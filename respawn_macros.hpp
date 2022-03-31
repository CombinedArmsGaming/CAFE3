#define RESPAWN_WAVE "Wave"
#define RESPAWN_TICKETS "Tickets"

#define RESPAWN_MODE_TIMED       {"MenuPosition", "Spectator", "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TIMED_WAVES {"MenuPosition", "Spectator", "Wave", "CAFE_Loadout", "CAFE_Squad"}
#define RESPAWN_MODE_TIMED_WAVES {"MenuPosition", "Spectator", "Wave", "CAFE_Loadout", "CAFE_Squad"}

#define RESPAWN_DEFAULTS(SIDE) STRING(CONCAT(CAFE_RespawnConfig_,SIDE)), "MenuPosition", "Spectator", "CAFE_Loadout", "CAFE_Squad"

#define RESPAWN_MODES(SIDE) CONCAT(RESPAWN_ARRAY_,SIDE)

#define DEFAULT_RESPAWN_ARRAY {RESPAWN_DEFAULTS}