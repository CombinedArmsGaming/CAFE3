#include "macros.hpp"

params ["_unit"];


_sideObits = switch (side group _unit) do
{
    case west:          { f_var_obituaries_blufor };
    case east:          { f_var_obituaries_opfor };
    case independent:   { f_var_obituaries_indfor };
    case civilian:      { f_var_obituaries_civ };
    default             { f_var_obituaries_global };

};

if (isNil '_sideObits') then {_sideObits = f_var_obituaries_global};
if (isNil '_sideObits') exitWith { "Rest in peace" };

_obit = selectRandom _sideObits;
if (isNil '_obit') then {_obit = selectRandom f_var_obituaries_global};
if (isNil '_obit') exitWith { "Rest in peace" };

_obit
