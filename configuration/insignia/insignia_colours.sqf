#include "macros.hpp"

if !EXISTS(f_dict_insignia_colours) then
{
    _keyValues =
    [
        ["RED",       "insignia_GI_B_RED"],
        ["ORANGE",    "insignia_GI_B_ORANGE"],
        ["YELLOW",    "insignia_GI_B_YELLOW"],
        ["GREEN",     "insignia_GI_B_GREEN"],
        ["BLUE",      "insignia_GI_B_BLUE"],
        ["CYAN",      "insignia_GI_B_CYAN"],
        ["MAGENTA",   "insignia_GI_B_MAGENTA"],
        ["PINK",      "insignia_GI_B_PINK"],
        ["PURPLE",    "insignia_GI_B_PURPLE"],
        ["WHITE",     "insignia_GI_B_WHITE"],
        ["LIGHTGREY", "insignia_GI_B_LGREY"],
        ["DARKGREY",  "insignia_GI_B_DGREY"],
        ["BLACK",     "insignia_GI_B_BLACK"],
        ["GREY",      "insignia_GI_B_GREY"],
        ["BROWN",     "insignia_GI_B_BROWN"],
        ["KHAKI",      "insignia_GI_B_TAN"]

    ];

    DICT_CREATE_VALS(f_dict_insignia_colours,_keyValues);

};