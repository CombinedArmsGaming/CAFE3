#include "macros.hpp"

SERVER_ONLY;

if (isNil 'f_arr_civPopModules') exitWith {};

{
	_areaArr = _x getVariable ["#area", []];
	_shouldIgnore = _x getVariable ["doNotCache", false];

	if !(_shouldIgnore or {_areaArr isEqualTo []}) then
	{
		_xDim = _areaArr select 1;
		_yDim = _areaArr select 2;

		_area = _xDim * _yDim;
		_radius = sqrt (_area / pi);

		_closeEnough = [_x, (f_param_caching_civpop + _radius)] call f_fnc_nearPlayerCluster;

#ifdef ENABLE_DEBUG

		_prevActive = _x getVariable ["#active", "wasd"];

		if !(_prevActive isEqualTo _closeEnough) then
		{
			_units = _x getVariable ["#unitCount", 0];
			_enableDisable = if (_closeEnough) then {"Enabling"} else {"Disabling"};
			DEBUG_FORMAT2_CHAT("[AICache] %1 a civilian presence module with %2 units.", _enableDisable, _units)
		};

#endif

		_x setVariable ["#active", _closeEnough, true];

	};

} forEach f_arr_civPopModules;