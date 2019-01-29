// CA - Briefing
// ====================================================================================

_briefing = "";
_briefing = _briefing + "
<font size='20'>CA Player Controls</font><br/><br/>

|- <execute expression=""_handle=createdialog 'RespawnWavesDialog';"">
Respawn system</execute><br/>
|- <execute expression=""if (serverCommandAvailable '#kick') then { [] execvm 'components\briefing\briefings\ca_briefing_admin.sqf'} else {hint 'You need to be an admin to get this!'};"">
Give self admin menu</execute><br/>

";
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["CA Player Controls",_briefing]];

// ====================================================================================
