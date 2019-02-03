// Respawn waves config

f_var_respawnMode        = 2;      // Respawn modes: 0: Off, 1: Base respawn, 2: Spawn on Commanding Officer
f_var_waveCooldown       = 300;     // Seconds between each wave plus wavetime below
f_var_waveTime           = 60;     // How many seconds each wave lasts where you can die and instantly respawn (Incase someone gets armaed on respawn or similar incidents)
f_var_respawnWavesAmount = 5;      // Number of waves the CO can call in.
f_var_respawnMarker      = "respawn_west";     // The respawn marker. Please use the corresponding marker for the side, ie "respawn_west", "respawn_east", "respawn_guerrila"
f_var_respawnInGroup     = true;   // Should respawning players stay a part of the group they died? They will not spawn next to them.
f_var_respawnMessage     = "Reinforcements have arrived.";     // Message to show in the chat when a respawn wave occurs.

// CA - Internal variables, just ignore
ca_respawnwave         = false;     // don't edit!
ca_lastRespawnWaveArgs = [0,0,0];
ca_respawnready        = true;      // Variable that allows wave to spawned
ca_respawntime         = 0;         // Variable for the countdown timer
