// CAFE - Caching Script Group Uncacher
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================

_this setvariable ["f_cached", false, true];

{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;

    // If the group leader is moving, set his group back next to him
    if ((speed leader _this > 0) && {vehicle _x == _x}) then
    {
    	_x setPosATL (formationPosition _x);
	};

	if (vehicle _x != _x) then
    {
        (vehicle _x) hideObjectGlobal false;
    };

    sleep 0.1;

} forEach (units _this);

true
