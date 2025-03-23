class respawn
{
    file = "components\respawn";
    class addFreeTicket{};
    class forceJoinGroupByName{};
    class getPlayerRespawnDelay{};
    class isRespawnModeActive{};
    class storePlayerGroup{postInit=1;};
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
class respawn_zen
{
    file = "components\respawn\zen";
    class allowImmediateRespawnLocal{};
    class zen_allowImmediateRespawn{};
    class zen_createRespawnPoint{};
    class zen_createRespawnSquare{};
    class zen_changeTickets{};
};
class respawn_ui
{
    file = "components\respawn\ui_functions";
    class addSpectatorDowntimeWidgetEventHandler{preInit=1;};
    class createSpectatorDowntimeWidget{};
    class spawnPickerDialog_onCloseDialog{};
    class spawnPickerDialog_populateDialog{};
    class spectatorDowntimeWidget_updateLoop{};
    class tryShowSpawnpointDialog{};
};
