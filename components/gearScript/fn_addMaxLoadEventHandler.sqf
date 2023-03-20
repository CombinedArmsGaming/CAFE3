if (hasInterface) then
{
    [
        "CA_PostGearscriptUnit_Local", 
        {
            params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

            if (_unit isNotEqualTo player) exitWith {};
        
            private _maxLoads = [0,0,0];

            private _uniform = uniformContainer _unit;
            if !(isNull _uniform) then
            {
                private _uniformLoad = loadAbs _uniform;
                private _uniformMaxLoad = maxLoad _uniform;

                if (_uniformLoad > _uniformMaxLoad) then
                {
                    _maxLoads set [0, _uniformLoad];
                };
            };

            private _vest = vestContainer _unit;
            if !(isNull _vest) then
            {
                private _vestLoad = loadAbs _vest;
                private _vestMaxLoad = maxLoad _vest;

                if (_vestLoad > _vestMaxLoad) then
                {
                    _maxLoads set [1, _vestLoad];
                };
            };

            private _backpack = backpackContainer _unit;
            if !(isNull _backpack) then
            {
                private _backpackLoad = loadAbs _backpack;
                private _backpackMaxLoad = maxLoad _backpack;

                if (_backpackLoad > _backpackMaxLoad) then
                {
                    _maxLoads set [2, _backpackLoad];
                };
            };
                
            if (_maxLoads isNotEqualTo [0,0,0]) then
            {
                [_unit, _maxLoads] remoteExecCall ["f_fnc_alterUnitMaxLoads", 2];
            };

        }

    ] call CBA_fnc_addEventHandler;
};