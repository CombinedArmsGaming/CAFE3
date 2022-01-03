#include "macros.hpp"


params ["_unit", "_alreadyDisabled"];
RUN_LOCAL_TO(_unit,_this,f_fnc_disableAI);


if (_alreadyDisabled) then
{
	_unit enableAI "PATH";
}
else
{
	_unit disableAI "PATH";
};
