
params ["_unit"];

// If the unit died the loop is finished
if (!alive _unit) exitWith {};

// If locality changed then transfer the loop
if (!local _unit) exitWith 
{
	[_unit] remoteExec ["ca_fnc_medicalOverrideLoop", _unit];
};

_currentBlood = _unit getVariable ["ace_medical_bloodVolume", 100];
_previousBlood = _unit getVariable ["ca_bonusBlood_lastBlood", _currentBlood];

_bloodDifference = _currentBlood - _previousBlood;

_bonusBlood = 0;

if (_bloodDifference > 0) then
{
	_bonusBlood = _bloodDifference * ace_medical_bleedingCoefficient - _bloodDifference;
	
}
else
{
	if (_bloodDifference < 0) then
	{
		_isUnconscious = _unit getVariable ["ace_isUnconscious", false];
		_isRevive = _unit getVariable ["ace_medical_inReviveState", false];
		
		_bleedMultiplier = 0;
		
		if (_isRevive) then {_bleedMultiplier = 5}
		else 
		{
			if (_isUnconscious) then {_bleedMultiplier = 1};
		};
		
		_bonusBlood = _bloodDifference * _bleedMultiplier;
	};
	
};

if (_bonusBlood != 0) then
{
	_currentBlood = _currentBlood + _bonusBlood;
	_currentBlood = _currentBlood max 0;
	
	_unit setVariable ["ace_medical_bloodVolume", _currentBlood];

};

if (_currentBlood < 30) then
{
	[_unit, true] call ace_medical_fnc_setDead;
	
};

_unit setVariable ["ca_bonusBlood_lastBlood", _currentBlood];

// Schedule the loop to be executed again 1 sec later
[ca_fnc_medicalOverrideLoop, [_unit], 1] call CBA_fnc_waitAndExecute;
