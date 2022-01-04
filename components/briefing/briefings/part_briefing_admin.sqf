// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// ADD MISSION MAKER NOTES SECTIONS
// All text added below will only be visible to the current admin

_customText = "";

// ====================================================================================

// ADMIN BRIEFING
// This is a generic section displayed only to the ADMIN

_briefing ="
<br/>
<font size='18'>ADMIN SECTION</font><br/>
This briefing section can only be seen by the current admin.
<br/><br/>
";

// ====================================================================================

// MISSION-MAKER NOTES
// This section displays notes made by the mission-maker for the ADMIN

if (_customText != "") then
{
	_briefing ="
	<br/>
	<font size='18'>MISSION-MAKER NOTES</font><br/>
	Notes and messages from the mission-maker:<br/>
	";

	_briefing = _briefing + _customText + "<br/><br/>";
};

// ====================================================================================

// SAFE START SECTION

_briefing = _briefing + "
<font size='18'>SAFE START CONTROL</font><br/>
|- <execute expression=""f_var_mission_timer = f_var_mission_timer + 1; publicVariable 'f_var_mission_timer'; hintsilent format ['Mission Timer: %1',f_var_mission_timer];"">
Increase Safe Start timer by 1 minute</execute><br/>

|- <execute expression=""f_var_mission_timer = f_var_mission_timer - 1; publicVariable 'f_var_mission_timer'; hintsilent format ['Mission Timer: %1',f_var_mission_timer];"">
Decrease Safe Start timer by 1 minute</execute><br/>

|- <execute expression=""[[[],'components\safeStart\init_component.sqf'],'BIS_fnc_execVM',true]  call BIS_fnc_MP;
hintsilent 'Safe Start started!';"">
Begin Safe Start timer</execute><br/>

|- <execute expression=""f_var_mission_timer = -1; publicVariable 'f_var_mission_timer';
[['SafeStartMissionStarting',['Mission starting now!']],'bis_fnc_showNotification',true] call BIS_fnc_MP;
[[false],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safe Start ended!';"">
End Safe Start timer</execute><br/>

|- <execute expression=""[[true],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safety on!' "">
Force safety on for all players</execute><br/>

|- <execute expression=""[[false],'f_fnc_safety',playableUnits + switchableUnits] call BIS_fnc_MP;
hintsilent 'Safety off!' "">
Force safety off for all players</execute><br/>

|- <execute expression=""[] spawn f_fnc_mapClickSupplyDropUnit;
"">
Map Click Supply Drop</execute><br/>

<br/>
";

// ====================================================================================

// ADD ZEUS SUPPORT SECTION

_briefing = _briefing + "
<font size='18'>ZEUS SUPPORT</font><br/>
<execute expression=""
if !(isNull (getAssignedCuratorLogic player)) then {hintsilent 'ZEUS already assigned!'} else {
	[[player,true],'f_fnc_zeusInit',false] spawn BIS_fnc_MP; hintsilent 'Curator assigned.';
};"">Assign ZEUS to host</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,playableUnits],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Added playable units.'};"">Add players and playable units to ZEUS object list</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {
	[[player,true,true],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Assigned control over all group leaders and empty vehicles.'};"">
Add all group leaders and empty vehicles</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,true],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; hintsilent 'Add all units.'};"">Add all mission objects</execute> <font color='#FF0000'>(POSSIBLE DESYNC)</font>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {(getAssignedCuratorLogic player) removeCuratorEditableObjects [allDead,true]; hintsilent 'Removed dead units.'};"">Remove all dead units from ZEUS</execute>.<br/>

|- <execute expression=""
if (isNull (getAssignedCuratorLogic player)) then {hintsilent 'Assign ZEUS first!'} else {[[player,false],'f_fnc_zeusAddObjects',false] spawn BIS_fnc_MP; [[player,false],'f_fnc_zeusAddAddons',false] spawn BIS_fnc_MP; hintsilent 'Removed powers and units.'};"">Remove all powers and objects from ZEUS</execute>.<br/>
<br/>
";


// ====================================================================================
// ADD SAFE END


_briefing = _briefing + "
<font size='18'>SAFE END</font><br/>
Moves all players to location on map click, automatically spaced out in a square.
Makes players/vehicles invincible for 5 min and restores them to full health.
Vehicles unable to fit are added to zeus while the players are moved. <br/>

|- <execute expression=""[] spawn f_fnc_safeEndStart;
hintsilent 'Click on the location in the map';"">Execute Safe End</execute><br/>

|- <execute expression="" onMapSingleClick '';
hintsilent 'Map Click Canceled!';"">Cancel Map Click</execute><br/>
";


// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["Admin",_briefing]];

// ====================================================================================
