params ["_group"];

_group setVariable ["lambs_danger_disableGroupAI", true, true];
_group setVariable ["Vcm_Disable", true, true];

{
    _x setVariable ["lambs_danger_disableAI", true, true];
} forEach (units _group);
