[
	"CAFE_GearscriptAssigned_Local", 
	{
        params ["_role", "_unit", "_faction", "_gearVariant"];
        if !(isPlayer _unit) exitWith {};

        [_unit] call f_fnc_addInsigniaMonitor;
    }

] call CBA_fnc_addEventHandler;