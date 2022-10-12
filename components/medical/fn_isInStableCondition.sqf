

params ["_unit"];

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
if ((_unit getVariable ["ace_medical_bloodVolume", 0])  < _requiredBloodVolume) exitWith {false};

// Unit must not have fractures
if((_unit getVariable ["ace_medical_fractures", []]) isNotEqualTo []) exitWith {false};

// Unit must not be in pain
if (_unit getVariable ["ace_medical_inPain", false]) exitWith {false};


// If there are any bandaged wounds, they have not been stitched.
private _hasUnstitchedWounds = (_unit getVariable ["ace_medical_bandagedWounds", []]) isNotEqualTo [];

// If there are any bandageable wounds that are open, there are open wounds. _x select 3 > 0 Discards any non-bleeding wounds, such as bruises.
private _hasOpenWounds = (((_unit getVariable ["ace_medical_openWounds", []] findIf {_x select 2 > 0 && _x select 3 > 0} ) != -1 ));

if(_hasOpenWounds || _hasUnstitchedWounds) exitWith {false};


true
