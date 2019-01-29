// Respawn waves config

ca_respawnmode    = 2;      // Respawn modes: 0: Off, 1: Base respawn, 2: Spawn on Commanding Officer
ca_wavecooldown   = 10;     // Seconds between each wave plus wavetime below
ca_wavetime       = 60;     // How many seconds each wave lasts where you can die and instantly respawn (Incase someone gets armaed on respawn or similar incidents)
ca_norespawnwaves = 5;      // Number of waves the CO can call in.
ca_respawnmarker  = "respawn_west";     // The respawn marker. Please use the corresponding marker for the side, ie "respawn_west", "respawn_east", "respawn_guerrila"
ca_respawningroup = true;   // Should respawning players stay a part of the group they died? They will not spawn next to them.
ca_respawnmsg     = "Reinforcements have arrived.";     // Message to show in the chat when a respawn wave occurs.

// CA - Internal variables, just ignore
ca_respawnwave         = false;     // don't edit!
ca_lastRespawnWaveArgs = [0,0,0];
ca_respawnready        = true;      // Variable that allows wave to spawned
ca_respawntime         = 0;         // Variable for the countdown timer
