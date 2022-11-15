class respawn
{
    file = "components\respawn";
    class addFreeTicket{};
    class getPlayerRespawnDelay{};
    class isRespawnModeActive{};
    class moduleRespawnPosition{};
};
class respawn_locationSystem
{
    file = "components\respawn";
    class addToRespawnPollers{};
    class getManagedRespawn{};
    class getRespawnKey{};
    class removeManagedRespawn{};
    class respawnManagerLoop{};
    class setRespawnLocation{};
    class updateManagedSpawnpoint{};
};
class respawn_triggeredWave
{
    file = "components\respawn\triggeredWave";
    class canTriggerRespawnWave{};
    class getRespawnTimestampForTarget{};
    class getSideRespawnDelayForTarget{};
    class triggerRespawnWave{};
    class tryTriggerRespawnWave{};
};
class respawn_triggeredWave_ui
{
    file = "components\respawn\triggeredWave\ui_functions";
    class triggeredWaveDialog_populateDialog{};
};
class respawn_redeployment
{
    file = "components\respawn";
    class createRedeployObject{};
    class doRedeployAction{};
};
