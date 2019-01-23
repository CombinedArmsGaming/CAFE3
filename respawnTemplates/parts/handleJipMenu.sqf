_handleJipMenu =
{
    if (!f_var_JIP_JIPMenu) exitWith {}; //do JIP players get teleport menu?

    sleep 5;

    if (isNil "F3_JIP_reinforcementOptionsAction") then
    {
    	[player] spawn f_fnc_addJipReinforcementOptionsAction;
    };

};
