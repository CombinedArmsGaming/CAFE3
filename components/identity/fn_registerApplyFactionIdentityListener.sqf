#ifdef ENABLE_IDENTITY_REPLACEMENT

[
	"CAFE_GearscriptAssigned_Local", 
	{
        params ["_role", "_unit", "_faction", "_gearVariant"];

        if (isPlayer _unit) exitWith {};
        if !(_unit isKindOf "CAManBase") exitWith {};
		
		[_unit, _gearVariant] call f_fnc_applyFactionIdentity;
	}

] call CBA_fnc_addEventHandler;

#endif