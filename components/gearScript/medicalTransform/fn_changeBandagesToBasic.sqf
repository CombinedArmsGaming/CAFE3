#include "..\macros.hpp"

params ["_container"];


_bandageTypes = ["ACE_elasticBandage", "ACE_packingBandage", "ACE_tourniquet"];

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _bandageTypes}}) then
    {
        _x set [0, "ACE_fieldDressing"];
    };

} forEach _container;


_container
