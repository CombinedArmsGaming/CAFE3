_tryTeleport =
{
    params ["_goto"];

    _onTeleportFailure =
    {
        params ["_unit", "_posAtlOrObject"];

        private _respawner = RESPAWN_ENTITY(side group player);

        if EXISTS(_respawner) then
        {
            DEBUG_FORMAT2_LOG("[RespawnWaves] Failed to teleport to %2, defaulting to respawner entity '%1'.",_respawner,_posAtlOrObject)
            [player, _respawner] spawn f_fnc_teleportPlayer;
        }
        else
        {
            DEBUG_FORMAT2_LOG("[RespawnWaves] Failed to teleport to %2, defaulting to location of %1.",RESPAWN_MARKER_POS((side group player)),_posAtlOrObject)
            _basePos = RESPAWN_MARKER_POS((side group player));
            [player, _basePos] spawn f_fnc_teleportPlayer;
        };

        _text = "Unable to teleport to the proper location.<br/><br/>You will need to find transportation to the AO or ping Zeus.";
        [_text] call f_fnc_createSubtitleText;

    };

    DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to teleport to %1.",_goto)
    _teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

    waitUntil { sleep 0.1; scriptDone _teleHandle };

};
