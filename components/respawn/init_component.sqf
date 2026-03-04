#include "macros.hpp"

DEBUG_PRINT_LOG("initting respawn")

if (isServer) then
{
    #ifdef RESPAWN_SIDE_TICKETS_BLUFOR
    [west, RESPAWN_SIDE_TICKETS_BLUFOR] call BIS_fnc_respawnTickets;
    #endif
    
    #ifdef RESPAWN_SIDE_TICKETS_OPFOR
    [east, RESPAWN_SIDE_TICKETS_OPFOR] call BIS_fnc_respawnTickets;
    #endif    
    
    #ifdef RESPAWN_SIDE_TICKETS_INDFOR
    [independent, RESPAWN_SIDE_TICKETS_INDFOR] call BIS_fnc_respawnTickets;
    #endif    
    
    #ifdef RESPAWN_SIDE_TICKETS_CIVILIAN
    [civilian, RESPAWN_SIDE_TICKETS_CIVILIAN] call BIS_fnc_respawnTickets;
    #endif


    #ifdef RESPAWN_DELAY_BLUFOR
    f_var_respawnDelay_blufor = RESPAWN_DELAY_BLUFOR;
    #else
    f_var_respawnDelay_blufor = 0;
    #endif
    
    #ifdef RESPAWN_DELAY_OPFOR
    f_var_respawnDelay_opfor = RESPAWN_DELAY_OPFOR;
    #else
    f_var_respawnDelay_opfor = 0;
    #endif    
    
    #ifdef RESPAWN_DELAY_INDFOR
    f_var_respawnDelay_indfor = RESPAWN_DELAY_INDFOR;
    #else
    f_var_respawnDelay_indfor = 0;
    #endif   
    
    #ifdef RESPAWN_DELAY_CIVILIAN
    f_var_respawnDelay_civilian = RESPAWN_DELAY_CIVILIAN;
    #else
    f_var_respawnDelay_civilian = 0;
    #endif


    #ifdef RESPAWN_WAVE_DURATION
    f_var_respawnDuration = RESPAWN_WAVE_DURATION;
    #else
    f_var_respawnDuration = 0;
    #endif

};

if (hasInterface) then
{
    #ifdef RESPAWN_PLAYER_TICKETS_BLUFOR

    if (playerSide isEqualTo west) then
    {
        [player, RESPAWN_PLAYER_TICKETS_BLUFOR] call BIS_fnc_respawnTickets;
    };

    #endif

    
    #ifdef RESPAWN_PLAYER_TICKETS_OPFOR

    if (playerSide isEqualTo east) then
    {
        [player, RESPAWN_PLAYER_TICKETS_OPFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_INDFOR

    if (playerSide isEqualTo independent) then
    {
        [player, RESPAWN_PLAYER_TICKETS_INDFOR] call BIS_fnc_respawnTickets;
    };

    #endif
    
    
    #ifdef RESPAWN_PLAYER_TICKETS_CIVILIAN

    if (playerSide isEqualTo civilian) then
    {
        [player, RESPAWN_PLAYER_TICKETS_CIVILIAN] call BIS_fnc_respawnTickets;
    };

    #endif


    // Keep updating player side in a var case selectPlayer or rating loss causes playerSide != side player.
    f_fnc_updatePlayerSideVar = 
    {
        player setVariable ["f_var_playerSide", playerSide, true];

        [
            // Script
            f_fnc_updatePlayerSideVar,
        
            // Arguments
            [],
        
            // Delay (secs)
            5
        
        ] call CBA_fnc_waitAndExecute;
    };

    [] call f_fnc_updatePlayerSideVar;


    f_fnc_updateCanUseRespawnMenu =
	{
        private _canRespawn = 
            ((leader group player) isEqualTo player) or
            {serverCommandAvailable '#kick'} or
            {player getVariable ["f_var_isZeus", false]};

        player setVariable ["f_var_canUseRespawnMenu", _canRespawn];

        [
            // Script
            f_fnc_updateCanUseRespawnMenu,
        
            // Arguments
            [],
        
            // Delay (secs)
            5
        
        ] call CBA_fnc_waitAndExecute;
	};
    
    [] call f_fnc_updateCanUseRespawnMenu;


    // Try to fix issue where if a player dies during unconsciousness, all mouse + keyboard input gets locked up.
    // Appears to be a timing issue - caused by downtime-spectator closing after player has died and entered respawn screen.
    // Note: player is technically not alive until respawned, as opposed to old respawn behaviour.
    // BUB 2022-08-09 TODO :: Try a more elegant solution by moving downtime system toward eventing instead of polling.
    [
        "ace_killed", 
        {
            [
                {
                    if ((_this#0) isEqualTo player) then 
                    {
                        ["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;
                    };
                },
            
                _this,            
                1
            
            ] call CBA_fnc_waitAndExecute;            
        }
    ] call CBA_fnc_addEventHandler;


    // Work around an issue where a player can get locked into an unrecoverable state
    // when they go back to the map respawn screen from the spectate respawn screen.
    f_fnc_disableReturnFromSpectateScreen = 
    {
        private _returnToMapButton = uiNamespace getVariable ["bis_rscrespawncontrolsspectate_ctrlbuttonspectate", controlNull];

        if (!isNull _returnToMapButton) then
        {
            _returnToMapButton ctrlEnable false;
            _returnToMapButton ctrlShow false;
        };

        // Wait until element needs modification again.
        [
            {
                private _returnToMapButton = uiNamespace getVariable ["bis_rscrespawncontrolsspectate_ctrlbuttonspectate", controlNull];
                (!isNull _returnToMapButton) and {(ctrlEnabled _returnToMapButton) or {ctrlShown _returnToMapButton}}
            },
            f_fnc_disableReturnFromSpectateScreen,
            []
        ] call CBA_fnc_waitUntilAndExecute;
    };

    // Wait until element has been created, then disable it.
    [
        {
            !isNull (uiNamespace getVariable ["bis_rscrespawncontrolsspectate_ctrlbuttonspectate", controlNull]);
        },
        f_fnc_disableReturnFromSpectateScreen,
        []
    ] call CBA_fnc_waitUntilAndExecute;



    // Force ACRE/TFAR spectate talk mode on/off when vanilla spectate screen is on/off.
    // Monitoring loop pt2 - wait until spectate inactive.
    f_fnc_spectate_forceRadioModSpectateMode = 
    {
        params ["_unit"];

        if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then {[true] call acre_api_fnc_setSpectator};
        if (["task_force_radio"] call ace_common_fnc_isModLoaded) then {[_unit, true] call TFAR_fnc_forceSpectator};

        // Wait until spectate screen is no longer displayed.
        [
            {		
                !(missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false])
            },
        
            {
                params ["_unit"];
                
                if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then {[false] call acre_api_fnc_setSpectator};
                if (["task_force_radio"] call ace_common_fnc_isModLoaded) then {[_unit, false] call TFAR_fnc_forceSpectator};	
                
                [f_fnc_spectate_forceRadioModSpectateModeLoop, _this] call CBA_fnc_execNextFrame;
            },

            _this

        ] call CBA_fnc_waitUntilAndExecute;
    };


    // Force ACRE/TFAR spectate talk mode on/off when vanilla spectate screen is on/off.
    // Monitoring loop pt1 - wait until spectate active.
    f_fnc_spectate_forceRadioModSpectateModeLoop = 
    {
        [
            {
                missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]
            },

            {
                [f_fnc_spectate_forceRadioModSpectateMode, _this] call CBA_fnc_execNextFrame;
            },

            [player]

        ] call CBA_fnc_waitUntilAndExecute;
    };

    [] call f_fnc_spectate_forceRadioModSpectateModeLoop;


    #ifdef HIDE_DEAD_IN_SQUAD

    // Replace previous behaviour of removing dead players from squad.
    // Instead, keep players in the squad but hide them from the HUD.
    if !(isNil 'diwako_dui_radar_sortType') then
    {
        diwako_dui_radar_customSort = 
        { 
            params ["_grp", "_player"]; 
            _grp = _grp select { alive _x };
            _grp
        };

        diwako_dui_radar_sortType = "custom";
    };

    f_var_hidingDeadPlayers = true;

    #endif

    #ifdef ALLOW_TELEPORT_UPON_RESPAWN
    f_var_allowingTpUponRespawn = true;
    #endif

    // playerLeaderOfGroup is only used for transferring leadership when the former group leader TPs in
    // Group leadership is only automatically transferred when HIDE_DEAD_IN_SQUAD is defined
    // No need to compute if you can't TP or the player keeps leadership anyway
    #ifdef HIDE_DEAD_IN_SQUAD
    #ifdef ALLOW_TELEPORT_UPON_RESPAWN
    if (player isEqualTo (leader group player)) then {
        (group player) setVariable ["f_var_playerLeaderOfGroup", name player, true];
        DEBUG_FORMAT2_LOG("[RESPAWN] Setting player leader of group %1 to %2", groupId group player, name player);
    };

    [] call f_fnc_leaderTagLoop;
    #endif
    #endif

};
