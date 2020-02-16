#include "..\macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeActivitySelector);

systemChat "Setting downtime experience to control...";

f_var_downtimeActivity = f_fnc_downtimeControl;
