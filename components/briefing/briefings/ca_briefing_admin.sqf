// CA - Briefing
// ====================================================================================

_briefing = "";
_briefing = _briefing + "
<font size='18'>F3 admin menu</font><br/><br/>
|- <execute expression="" [] execvm 'components\briefing\briefings\part_briefing_admin.sqf' "">
Give self F3 admin menu</execute><br/>
<font size='18'>Respawn system</font><br/><br/>
<font size='14'>Note that the marker will only be moved if respawn mode is set to 2 (spawn on co)</font><br/><br/>
|- <execute expression=""hint 'Wave spawned!'; [] remoteExec ['f_fnc_respawnWaveServer', 2];"">
Force respawn wave to happen even with 0 waves (Doesn't move respawn marker)</execute><br/>
|- <execute expression=""hint 'Wave spawned!'; [] call f_fnc_respawnwave;"">
Spawn respawn wave(Move respawn marker)</execute><br/>
";
/*
_briefing = _briefing + "
<font size='18'>Ai spawn buttons </font><br/><br/>
|- <execute expression=""[['SC1_CA','SC1_CA_1','SC1_CA_2'],['ftl','ar','r','r','r'],'SC1_CA_A','opf_f',east] spawn ca_fnc_massattack"">
Spawn big wave on west, east and north hill</execute><br/>
";

*/
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["CA Admin",_briefing]];

// ====================================================================================
