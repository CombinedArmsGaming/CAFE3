
#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting client misc")


if IS_TRUE(f_var_showClassicIntroAtStart) then
{
    [] spawn f_fnc_sitautionInfoIntro;
};


[] spawn
{
    while {true} do
    {
        [player, 7500] call f_fnc_setRating;
        sleep 5;
    };

};
