// CA - Briefing
// ====================================================================================

_briefing = "";
_briefing = _briefing + "
<font size='18'>F3 admin menu</font><br/><br/>
|- <execute expression="" [] execvm 'components\briefing\briefings\part_briefing_admin.sqf' "">
Give self F3 admin menu</execute><br/>
<font size='18'>Respawn system</font><br/><br/>

|- <execute expression=""hint 'Wave spawned!'; [west] call f_fnc_forceRespawnWave;"">
Force respawn wave for BLUFOR.</execute><br/><br/>
|- <execute expression=""hint 'Wave spawned!'; [east] call f_fnc_forceRespawnWave;"">
Force respawn wave for OPFOR.</execute><br/><br/>
|- <execute expression=""hint 'Wave spawned!'; [independent] call f_fnc_forceRespawnWave;"">
Force respawn wave for INDFOR.</execute><br/><br/>
|- <execute expression=""hint 'Wave spawned!'; [civilian] call f_fnc_forceRespawnWave;"">
Force respawn wave for CIV.</execute><br/><br/>
";
/*
_briefing = _briefing + "
<font size='18'>Ai spawn buttons </font><br/><br/>
|- <execute expression=""[['SC1_CA','SC1_CA_1','SC1_CA_2'],['ftl','ar','r','r','r'],'SC1_CA_A','opf_f',east] spawn f_fnc_massattack"">
Spawn big wave on west, east and north hill</execute><br/>
";

*/
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["CA Admin",_briefing]];

// ====================================================================================
