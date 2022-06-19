params ["_respawnModeName", ["_side", playerSide]];

private _respawnTemplates = getArray (missionConfigFile >> ("respawnTemplates" + (str _side)));
private _respawnModePresent = (_respawnTemplates findIf {_x isEqualTo _respawnModeName}) >= 0;

_respawnModePresent