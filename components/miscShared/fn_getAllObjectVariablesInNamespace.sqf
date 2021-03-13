
_objectVars = [];

{
	if (typeName (_this getVariable _x) isEqualTo "OBJECT") then
    {
		_objectVars pushBack _x;
	};
} forEach (allVariables _this);

_objectVars
