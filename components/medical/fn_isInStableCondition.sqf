

params ["_unit"];

// Copied from ACE3/addons/medical_engine/script_macros_medical.hpp
#define ALL_BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]

// Hard-coding variables that would otherwise be in CBA and/or I can't seem to retrieve (defaultBloodVolume. These should be safe to hard-code.
private _minHeartRatePAK = 40;
private _minBloodPAK = 0.85;
private _defaultBloodVolume = 6;

// If the unit is dead, unconscious, bleeding, or below minimum heart rate, we cannot PAK.
if (!alive _unit
    || {(_unit getVariable ["ACE_isUnconscious", false])}
    || {(_unit getVariable ["ace_medical_woundBleeding", 0]) > 0}
    || {(_unit getVariable ["ace_medical_heartRate", 0]) < _minHeartRatePAK}
) exitWith {false};

// If they have insufficient blood, we cannot PAK.
private _requiredBloodVolume = _defaultBloodVolume * (_minBloodPAK / 100);
if ((_unit getVariable ["ace_medical_bloodVolume", 0]) < _requiredBloodVolume) exitWith {false};

// Unit must not have fractures
private _fractures = _unit getVariable ["ace_medical_fractures", []];
if ((_fractures findIf {_x isEqualTo 1}) != -1) exitWith {false};

// Unit must not be in pain
if (_unit getVariable ["ace_medical_pain", 0] > 0.05) exitWith {false};

// Check for active wounds that are bleeding (and thus need to be bandaged)
private ["_partX", "_woundsX"];
private _openWounds    = _unit getVariable ["ace_medical_openWounds", createHashMap];
private _hasOpenWounds = (ALL_BODY_PARTS findIf {
	_partX   = _x;
	_woundsX = _openWounds getOrDefault [_partX, []];

	(_woundsX findIf {_x # 1 > 0 and {_x # 2 > 0}}) >= 0 // amountOf > 0 and _bleedingRate > 0
} >= 0);

// Check for bandaged wounds that need to be stitched
private _bandagedWounds = _unit getVariable ["ace_medical_bandagedWounds", createHashMap];
private _hasUnstitchedWounds = (ALL_BODY_PARTS findIf {
	_partX   = _x;
	_woundsX = _bandagedWounds getOrDefault [_partX, []];

	(_woundsX findIf {_x # 1 > 0 and {_x # 2 > 0}}) >= 0 // amountOf > 0 and _bleedingRate > 0
} >= 0);

if (_hasOpenWounds or _hasUnstitchedWounds) exitWith {false};

true
