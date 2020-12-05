
params ["_unit"];

_insigniaArr = _unit getVariable ["f_arr_currentInsignia", []];

if !(_insigniaArr isEqualTo []) then
{
    _unit setObjectTexture _insigniaArr;
};
