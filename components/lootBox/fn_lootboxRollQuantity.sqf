#include "macros.hpp"

params ["_quantities"];

_quantity = 1;

if (typeName _quantities isEqualTo "SCALAR") then
{
    _quantity = _quantities;
}
else
{
    if (typeName _quantities isEqualTo "ARRAY") then
    {
        if (count _quantities == 2) then
        {
            _range = (_quantities select 1) - (_quantities select 0);
            _quantity = (_quantities select 0) + (round (random _range));
        }
        else
        {
            if (count _quantities == 3) then
            {
                _quantity = random _quantities;
            };
            
        };

    };

};

_quantity
