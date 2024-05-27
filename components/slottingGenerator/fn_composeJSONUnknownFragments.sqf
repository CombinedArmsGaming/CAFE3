params ["_structure"];

if (isNil "_structure") exitWith {["null"]};

switch (typeName _structure) do 
{
	case "STRING": {[str _structure]};
	case "ARRAY": 
	{
		if (count _structure <= 0) exitWith {["[]"]};
		private _sampleContent = _structure#0;

		switch (typeName _sampleContent) do 
		{
			case "ARRAY": 
			{
				if ((count _sampleContent == 2) and {(_sampleContent#0) isEqualType ""}) exitWith 
				{
					[_structure] call f_fnc_composeJSONObjectFragments
				};
				
				private _outputFragments = [];					
				_outputFragments pushBack "[";

				private _objectOutputs = [];
				{
					_objectOutputs pushBack ([_x] call f_fnc_composeJSONObjectFragments)

				} forEach _structure;

				private _maxCount = (count _objectOutputs) - 1;
				for "_i" from 0 to _maxCount do 
				{
					_outputFragments append (_objectOutputs # _i);
					if (_i != _maxCount) then {_outputFragments pushBack ","};
				};

				_outputFragments pushBack "]";
				_outputFragments
			};
			default {[str _structure]};
		}
	};
	case "NUMBER": {[str _structure]};
	case "BOOL": {[str _structure]};
	default { throw format ["Unsupported object type %1", typeName _structure] };
}