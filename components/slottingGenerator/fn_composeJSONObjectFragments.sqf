params ["_structure"];

private _outputFragments = [];

_outputFragments pushBack "{";

private _innerProperties = [];

{
	private _propertyFragments = [];

	switch (count _x) do 
	{
		case 2:
		{
			_x params ["_key", "_value"];
			_propertyFragments pushBack format ['"%1": ', _key];
			_propertyFragments append ([_value] call f_fnc_composeJSONUnknownFragments);
		};
		default {continue};
	};
	
	if (count _propertyFragments > 0) then
	{
		_innerProperties pushBack _propertyFragments;
	};

} forEach _structure;

private _maxCount = (count _innerProperties) - 1;
for "_i" from 0 to _maxCount do 
{
	_outputFragments append (_innerProperties # _i);
	if (_i != _maxCount) then {_outputFragments pushBack ","};
};

_outputFragments pushBack "}";

_outputFragments