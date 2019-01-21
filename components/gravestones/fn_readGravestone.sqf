
_unitWithin = _target getVariable ["UnitWithin", "a forgotten soul"];
_unitWithin = _unitWithin splitString "<\/>" joinString " ";

_timeOfDeath = _target getVariable ["UnitDeathTime", 0];
_obituary = _target getVariable ["UnitObituary", "Rest in peace"];

_baseDayTime = daytime - time / 3600;
_deathDayTime = _baseDayTime + (_timeOfDeath / 3600);

_deathTimeReadable = [_deathDayTime, "HH:MM"] call BIS_fnc_timeToString;

_text = format
[
"<t color='#FFFFFF' shadow='2' shadowColor='#000000'>
Here lies %1<br/>
Died at %2<br/>
<br/>
""%3""
</t>",
_unitWithin,
_deathTimeReadable,
_obituary
];

titleText
[
	_text,
	"PLAIN",
	1,
	false,
	true
];
