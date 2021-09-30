#include "..\..\squadmarker_macros.hpp"

if !EXISTS(f_dict_insignia_colours) then
{
    _keyValues =
    [
        [str COLOUR_RED,       "insignia_GI_B_RED"],
        [str COLOUR_ORANGE,    "insignia_GI_B_ORANGE"],
        [str COLOUR_YELLOW,    "insignia_GI_B_YELLOW"],
        [str COLOUR_GREEN,     "insignia_GI_B_GREEN"],
        [str COLOUR_BLUE,      "insignia_GI_B_BLUE"],
        [str COLOUR_CYAN,      "insignia_GI_B_CYAN"],
        [str COLOUR_MAGENTA,   "insignia_GI_B_MAGENTA"],
        [str COLOUR_PINK,      "insignia_GI_B_PINK"],
        [str COLOUR_PURPLE,    "insignia_GI_B_PURPLE"],
        [str COLOUR_WHITE,     "insignia_GI_B_WHITE"],
        [str COLOUR_LIGHTGREY, "insignia_GI_B_LGREY"],
        [str COLOUR_DARKGREY,  "insignia_GI_B_DGREY"],
        [str COLOUR_BLACK,     "insignia_GI_B_BLACK"],
        [str COLOUR_GREY,      "insignia_GI_B_GREY"],
        [str COLOUR_BROWN,     "insignia_GI_B_BROWN"],
        [str COLOUR_KHAKI,     "insignia_GI_B_TAN"]
    ];

    f_dict_insignia_colours = createHashMapFromArray _keyValues;

};
