#include "..\macros.hpp"

params ["_text"];

_title = "This might take a while...";

if !(IS_TRUE(f_var_downtimeDialog_notFirstTime)) exitWith
{
    f_var_downtimeDialog_notFirstTime = true;
};

_title = selectRandom [
    "Hello, old friend.",
    "Ah, you're back.",
    "Welcome back."
];

_text ctrlSetText _title;
