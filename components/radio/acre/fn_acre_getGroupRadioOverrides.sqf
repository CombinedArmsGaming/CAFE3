// ACRE integration for CAFE, by Bubbus

params ["_group"];

private _groupId = groupId _group;

private _sideName = switch (side _group) do 
{
	case west: 		  {"blufor"};
	case east: 		  {"opfor"};
	case independent: {"indfor"};
	case civilian: 	  {"civilian"};
	default    		  {"civilian"};
};

private _srConfig = missionNamespace getVariable [format ["f_arr_acre_sr_groups_%1", _sideName], []];
private _lrConfig = missionNamespace getVariable [format ["f_arr_acre_lr_groups_%1", _sideName], []];
private _xlrConfig = missionNamespace getVariable [format ["f_arr_acre_xlr_groups_%1", _sideName], []];

private _groupChannelIndex = _srConfig findIf {((_x#1) findIf {(toLower _x) isEqualTo (toLower _groupId)}) >= 0};
private _groupLRChannelIndex = _lrConfig findIf {((_x#1) findIf {(toLower _x) isEqualTo (toLower _groupId)}) >= 0};
private _groupXLRChannelIndex = _xlrConfig findIf {((_x#1) findIf {(toLower _x) isEqualTo (toLower _groupId)}) >= 0};

[_unit, _groupChannelIndex, _groupLRChannelIndex, _groupXLRChannelIndex] call f_fnc_acre_setUnitRadioChannels;