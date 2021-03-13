#include "macros.hpp"

LOCAL_ONLY(_this);

_name = vehicleVarName _this;
if ((_name find "scale") isNotEqualTo 0) exitWith { false };

_nameParts = _name splitString "_";

if (count _nameParts < 2) exitWith { false };

_num = _nameParts#1;
_num = (_num splitString "p" joinString ".");
_parsedNum = parseNumber _num;

if (_parsedNum <= 0) exitWith { false };

f_arr_scaleEntities pushBack [_this, _parsedNum];

true
