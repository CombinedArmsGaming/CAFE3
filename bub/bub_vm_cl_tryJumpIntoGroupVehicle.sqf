params ["_unit", "_groupName"];

_group = grpNull;

{
	scopeName "sqfSucks";
	if (groupId _x == _groupName) then
	{
		_group = _x;
		breakOut "sqfSucks";
	};
} forEach allGroups;
	

if (_group == grpNull) exitWith
{
	systemChat format ["Error: Was unable to find a group named '%1'.", _groupName];
};

_vehicle = vehicle leader _group;
if (isNull _vehicle) exitWith
{
	systemChat format ["The leader of group '%1' is not currently in a vehicle.", _groupName];
};

_seatCount = [typeOf _vehicle, true] call BIS_fnc_crewCount;
_crewCount = count fullCrew _vehicle;
_seatsLeft = _seatCount - _crewCount;

if (_seatsLeft < 1) exitWith
{
	systemChat format ["All of the seats in %1's vehicle are full.", _groupName];
};

_success = _unit moveInAny _vehicle;

if (!_success) exitWith
{
	systemChat format ["Failed to jump into %1's vehicle for an unknown reason.  Ping your Zeus!", _groupName];
};

_textToSend = format ["%1 has teleported into your vehicle.", name _unit];
_textRecipient = driver _vehicle;
if (isNull _textRecipient) then {_textRecipient = leader _group};

if (isPlayer _textRecipient) then
{
	[_textToSend, "PLAIN", 0.3] remoteExec ["titleText", _textRecipient];
}
	
