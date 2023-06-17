if (hasInterface) then
{
    f_arr_playerGogglesCache = [""];

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
    };

    [
        "CA_PreGearscriptUnit_Local", 
        {
            params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

            f_var_firstPlayerLoadout = true;

            if ((_unit isEqualTo player) and {!isNil 'f_var_playerGoggles'}) then
            {
                _loadout set [7, f_var_playerGoggles];
            };
        }

    ] call CBA_fnc_addEventHandler;
};