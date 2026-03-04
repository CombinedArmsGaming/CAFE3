#include "macros.hpp"

if (hasInterface) then
{
    f_arr_playerGogglesCache = [""];

    [
        "CA_PreGearscriptUnit_Local", 
        {
            params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

            f_var_firstPlayerLoadout = true;

            if !(_loadout isEqualType []) exitWith {};

            if ((_unit isEqualTo player)) then {
                private _goggles = goggles _unit;
                f_var_playerGoggles = _goggles;
                DEBUG_FORMAT1_LOG("[GEARSCRIPT-2] Detected goggles on player: %1", f_var_playerGoggles);
                // _loadout set [7, f_var_playerGoggles];
            };
            
            if ((_unit isEqualTo player) and {!isNil 'f_var_playerGoggles'}) then
            {
                private _gearVariant = _unit getVariable ["f_var_assignGear_sideName", ""];
                if (f_var_playerGoggles != "" and !(FACEWEAR_FORCED_DYNAMIC(_gearVariant,_typeOfUnit))) then {
                    DEBUG_FORMAT1_LOG("[GEARSCRIPT-2] Set loadout to have: %1", f_var_playerGoggles);
                    _loadout set [7, f_var_playerGoggles];
                } else {
                    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2] Applied gearscript goggles. playerGoggles var: %1, forceFacewear: %2", f_var_playerGoggles, FACEWEAR_FORCED_DYNAMIC(_gearVariant,_typeOfUnit));
                };
            }
        }

    ] call CBA_fnc_addEventHandler;
};