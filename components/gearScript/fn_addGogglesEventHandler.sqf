#include "macros.hpp"

if (hasInterface) then
{
    f_arr_playerGogglesCache = [""];

    // onPreloadFinished {
    //     DEBUG_PRINT_LOG("LOADED!!!");
    //     private _goggles = goggles player;
    //     f_var_playerGoggles = _goggles;
    //     DEBUG_FORMAT1_LOG("[GEARSCRIPT-2] Detected goggles on player: ", f_var_playerGoggles);
    // };

    // Attempt to get player's chosen goggles by checking the value each frame until the gearscript occurs.  
    // If something appears, we figure it's the player's choice.  This isn't a great way to do it but it's what we've got.
    [] spawn
    {
        waitUntil
        {
            if (missionNamespace getVariable ["f_var_firstPlayerLoadout", false]) exitWith {true};

            private _goggles = goggles player;
            f_arr_playerGogglesCache pushBackUnique _goggles;
            
            _goggles IsNotEqualTo "";
        };


        f_var_playerGoggles = f_arr_playerGogglesCache select -1;
        DEBUG_PRINT_CHAT("test");
        systemChat "hello?";
        diag_log("[GEARSCRIPT-2] HELLOO????");
        systemChat "goggles" + f_var_playerGoggles;
        DEBUG_FORMAT2_LOG("[GEARSCRIPT-2] Detected goggles on player %1", f_var_playerGoggles);
    };

    [
        "CA_PreGearscriptUnit_Local", 
        {
            params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

            f_var_firstPlayerLoadout = true;

            if !(_loadout isEqualType []) exitWith {};

            // if ((_unit isEqualTo player)) then {
            //     private _goggles = goggles _unit;
            //     f_var_playerGoggles = _goggles;
            //     DEBUG_PRINT_LOG("[GEARSCRIPT-2] Detected goggles on player: "+ f_var_playerGoggles);
            //     DEBUG_PRINT_LOG("[GEARSCRIPT-2] getpos returns type " + typeName (getPos _unit));
            //     DEBUG_FORMAT1_LOG("[GEARSCRIPT-2] player pos: ", ((getPos _unit) select 0));
            //     // _loadout set [7, f_var_playerGoggles];
            // };
            
            if ((_unit isEqualTo player) and {!isNil 'f_var_playerGoggles'}) then
            {
                private _gearVariant = _unit getVariable ["f_var_assignGear_sideName", ""];
                if (f_var_playerGoggles != "" and !(FACEWEAR_FORCED_DYNAMIC(_gearVariant,_typeOfUnit))) then {
                    DEBUG_FORMAT1_LOG("[GEARSCRIPT-2] Detected goggles, set loadout to have: %1", f_var_playerGoggles);
                    _loadout set [7, f_var_playerGoggles];
                } else {
                    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2] Did not allow player goggles. playerGoggles var: %1, forceFacewear: %2, _gearVariant: %3", f_var_playerGoggles, FACEWEAR_FORCED_DYNAMIC(_gearVariant,_typeOfUnit), _gearVariant);
                };
            }
        }

    ] call CBA_fnc_addEventHandler;
};