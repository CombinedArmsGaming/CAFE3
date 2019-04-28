#include "macros.hpp"

params ["_veh", "_pushDir", "_pushPos"];

RUN_LOCAL_TO(_veh,f_fnc_pushVehicle,_this);

_pushPosLocal = _veh worldToModel _pushPos;
_pushForce = _pushDir vectorMultiply 10000;

_veh addForce [_pushForce, _pushPosLocal];
