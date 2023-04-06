if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
    #include "..\acre\configuration\acre_preConfiguration.sqf";
    #include "..\..\..\configuration\acre_radio_configuration.sqf"
    #include "..\acre\configuration\acre_postConfiguration.sqf";
};