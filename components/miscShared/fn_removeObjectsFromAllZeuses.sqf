#include "macros.hpp"

RUN_ON_SERVER(f_fnc_removeObjectsFromAllZeuses,_this);

SERVER_ONLY;

{
	_x removeCuratorEditableObjects [_this, true];
} forEach allCurators;
