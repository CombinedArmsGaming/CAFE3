#include "..\..\squadmarker_macros.hpp"

if !EXISTS(f_dict_insignia_colours) then
{
    _keyValues =
    [
        [str RED,       "insignia_GI_B_RED"],
        [str ORANGE,    "insignia_GI_B_ORANGE"],
        [str YELLOW,    "insignia_GI_B_YELLOW"],
        [str GREEN,     "insignia_GI_B_GREEN"],
        [str BLUE,      "insignia_GI_B_BLUE"],
        [str CYAN,      "insignia_GI_B_CYAN"],
        [str MAGENTA,   "insignia_GI_B_MAGENTA"],
        [str PINK,      "insignia_GI_B_PINK"],
        [str PURPLE,    "insignia_GI_B_PURPLE"],
        [str WHITE,     "insignia_GI_B_WHITE"],
        [str LIGHTGREY, "insignia_GI_B_LGREY"],
        [str DARKGREY,  "insignia_GI_B_DGREY"],
        [str BLACK,     "insignia_GI_B_BLACK"],
        [str GREY,      "insignia_GI_B_GREY"],
        [str BROWN,     "insignia_GI_B_BROWN"],
        [str KHAKI,     "insignia_GI_B_TAN"]
    ];

    DICT_CREATE_VALS(f_dict_insignia_colours,_keyValues);

};
