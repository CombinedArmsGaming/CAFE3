// Messy way to get a dead zeus player to respawn as a zeus again.

if (missionNamespace getVariable ["f_var_tempRespawnAsZeus", false]) then
{
    f_var_tempRespawnAsZeus = false;
    [player] call f_fnc_registerZeusPlayer;

};
