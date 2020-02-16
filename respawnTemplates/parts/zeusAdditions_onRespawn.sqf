// Messy way to get a dead zeus player to respawn as a zeus again.

if (missionNamespace getVariable ["f_var_tempRespawnAsZeus", false]) then
{
    f_var_tempRespawnAsZeus = false;
    
    player setVariable ["f_var_isKillLogRecipient", true, true];
    player setVariable ["f_var_isZeus", true, true];

};
