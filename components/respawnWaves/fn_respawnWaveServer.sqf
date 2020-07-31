#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_respawnWaveServer);
SERVER_ONLY;

params [["_posOrObject", []], "_side"];


if (_posOrObject isEqualTo []) then
{
    _posOrObject = RESPAWN_MARKER_POS(_side);
};




_squads = RESPAWN_WAVE_SQUADS(_side);
_squadName = "";
if (count _squads <= 0) then
{
    _squadName = "Reinforcements";
}
else
{
    _squadName = _squads deleteAt 0;
};

_groups = allGroups;
_respawnGroup = _groups param [_groups findIf {(toLower groupId _x) isEqualTo (toLower _squadName)}, grpNull];

if (isNull _respawnGroup) then
{
    _respawnGroup = createGroup _side;
    _respawnGroup setGroupIdGlobal [_squadName];
    _respawnGroup deleteGroupWhenEmpty false;

    // TODO :: Group joining issues.  Maybe the group doesn't get propagated in time.  Let's test.
    sleep 5;
};



SET_RESPAWN_WAVE_READY(_side,false);

_waveArray = [true, _posOrObject, _respawnGroup, time];
SET_RESPAWN_WAVE(_side,_waveArray);

_curWaves = RESPAWN_WAVES(_side);
SET_RESPAWN_WAVES(_side,(_curWaves - 1));

_message = RESPAWN_MESSAGE(_side);
_message remoteExec ["systemChat", _side];




sleep RESPAWN_WAVE_DURATION(_side);

CLEAR_RESPAWN_WAVE(_side);

sleep RESPAWN_WAVE_COOLDOWN(_side);

SET_RESPAWN_WAVE_READY(_side,true);
