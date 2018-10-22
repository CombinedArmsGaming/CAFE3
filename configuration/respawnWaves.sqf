// Respawn waves config

missionNamespace setVariable ['ca_respawnmode',0, true]; // Respawn modes: 0: Off, 1: Base respawn, 2: Spawn on Commanding Officer
missionNamespace setVariable ['ca_respawnwave',false, true]; // set to true for instant respawn
missionNamespace setVariable ['ca_wavecooldown',540, true]; // Seconds between each wave plus wavetime below
missionNamespace setVariable ['ca_wavetime',60, true]; // How many seconds each wave lasts where you can die and instantly respawn (Incase someone gets armaed on respawn or similar incidents)
missionNamespace setVariable ['ca_norespawnwaves',5, true]; // Number of waves the CO can call in.
missionNamespace setVariable ['ca_respawnmarker',"respawn_west", true]; // The respawn marker. Please use the corresponding marker for the side, ie "respawn_west", "respawn_east", "respawn_guerrila"
missionNamespace setVariable ['ca_respawningroup',true, true]; // Should respawning players stay a part of the group they died? They will not spawn next to them.

// CA - Internal variables, just ignore
missionNamespace setVariable ['ca_respawnready',true, true]; // Variable that allows wave to spawned
missionNamespace setVariable ['ca_respawntime',0, true]; // Variable for the countdown timer
