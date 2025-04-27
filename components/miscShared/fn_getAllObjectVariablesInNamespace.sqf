
_objectVars = [];

{
	if ((_this getVariable _x) isEqualType objNull) then
    {
		_objectVars pushBack _x;
	};
} forEach (allVariables _this);

_objectVars
