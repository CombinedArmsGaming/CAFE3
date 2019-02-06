params ["_container"];


_fluids250 = ["ACE_salineIV_250", "ACE_plasmaIV_250"];
_fluids500 = ["ACE_salineIV_500", "ACE_plasmaIV_500"];
_fluids1000 = ["ACE_salineIV_1000", "ACE_plasmaIV_1000"];

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _fluids250}}) then
    {
        _x set [0, "ACE_bloodIV_250"];
    };

} forEach _container;

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _fluids500}}) then
    {
        _x set [0, "ACE_bloodIV_500"];
    };

} forEach _container;

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _fluids1000}}) then
    {
        _x set [0, "ACE_bloodIV"];
    };

} forEach _container;


_container
