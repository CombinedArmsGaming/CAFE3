
#include "macros.hpp"

params ["_object", "_types"];

(_types findIf {_object isKindOf _x} >= 0)
