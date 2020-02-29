#include "..\macros.hpp"

params ["_text"];

_title = "This might take a while...";

if !(IS_TRUE(f_var_downtimeDialog_notFirstTime)) exitWith
{
    f_var_downtimeDialog_notFirstTime = true;
};

_title = selectRandom [
    "Hello, old friend.",
    "We've been here before.",
    "Ah, you're back.",
    "You're not done yet.",
    "Welcome back.",
    "Since you're here..."
];

_text ctrlSetText _title;
