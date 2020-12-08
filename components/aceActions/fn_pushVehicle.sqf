#include "macros.hpp"

params ["_veh", "_pushDir", "_pushPos"];

RUN_LOCAL_TO(_veh,f_fnc_pushVehicle,_this);

_pushPosLocal = _veh worldToModel _pushPos;
_vehMass = getMass _veh;
_forceLength = (_vehMass * 8) min 20000;
_pushForce = _pushDir vectorMultiply _forceLength;

_veh addForce [_pushForce, _pushPosLocal];
