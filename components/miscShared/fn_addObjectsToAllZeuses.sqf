#include "macros.hpp"

RUN_ON_SERVER(f_fnc_addObjectsToAllZeuses,_this);

SERVER_ONLY;

{
	_x addCuratorEditableObjects [_this, true];
} forEach allCurators;
