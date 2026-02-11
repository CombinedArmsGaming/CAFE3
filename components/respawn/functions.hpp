class respawn
{
    file = "components\respawn";
    class addFreeTicket{};
    class forceJoinGroupByName{};
    class getPlayerRespawnDelay{};
    class isRespawnModeActive{};
    class storePlayerGroup{postInit=1;};
    class leaderTagLoop{};
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
class respawn_zen
{
    file = "components\respawn\zen";
    class allowImmediateRespawnLocal{};
	class doRespawnSquare{};
	class selectFromDeadPlayers{};
    class zen_allowImmediateRespawn{};
    class zen_createRespawnPoint{};
	class zen_createRespawnSquare{};
    class zen_respawnRandomAtSquare{};
    class zen_changeTickets{};
};
class respawn_ui
{
    file = "components\respawn\ui_functions";
    class addSpectatorDowntimeWidgetEventHandler{preInit=1;};
    class createSpectatorDowntimeWidget{};
    class spectatorDowntimeWidget_updateLoop{};
    class tryShowSpawnpointDialog{};
};
class respawn_ui_spawnPickerDialog
{
    file = "components\respawn\ui_functions\spawnPickerDialog";
    class spawnPickerDialog_delaySpawnUntilReady{};
    class spawnPickerDialog_deselectWithoutScrolling{};
    class spawnPickerDialog_getListIdxFromSpawnIdx{};
    class spawnPickerDialog_groupsList_onLBSelChanged{};
    class spawnPickerDialog_loadoutsList_onLBSelChanged{};
    class spawnPickerDialog_onCloseDialog{};
    class spawnPickerDialog_populateDialog{};
    class spawnPickerDialog_populateLoadoutsList{};
    class spawnPickerDialog_spawnList_onLBSelChanged{};
    class spawnPickerDialog_switchInfoBox{};
    class spawnPickerDialog_updateLoop{};
    class spawnPickerDialog_updateTickets{};
    class spawnPickerDialog_updateTimers{};
};
