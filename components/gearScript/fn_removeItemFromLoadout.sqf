#include "macros.hpp"

params ["_faction", "_unitType", "_itemName"];

_faction = toLower _faction;
_unitType = toLower _unitType;

private _loadoutVariants = LOADOUT_VAR_DYNAMIC(_faction,_unitType);

if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2'.  Cannot remove item '%3'.",_unitType,_faction,_itemName)
};

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Removing item '%1' from loadout '%2' for side '%3'.",_itemName,_unitType,_faction)

private _removeItem = 
{
    params ["_content", "_toRemove"];

    private _returnArray = [];

    {
        private _originalX = _x;
        private _name = _x#0;

        while {_name isEqualType []} do
        {
            _x = _name;
            _name = _x#0;
        };

        if (_name isNotEqualTo _toRemove) then 
        { 
            _returnArray pushBack _originalX;            
        };        

    } forEach _content;

    _returnArray
};

{    
    private _loadout = _x;

    private _uniform = _loadout#3;
    if (_uniform isNotEqualTo []) then
    {
        private _uniformContent = _uniform#1;
        private _cleanUniformContent = [_uniformContent, _itemName] call _removeItem;
        
        _uniform set [1, _cleanUniformContent];
    };

    private _vest = _loadout#4;
    if (_vest isNotEqualTo []) then
    {
        private _vestContent = _vest#1;
        private _cleanVestContent = [_vestContent, _itemName] call _removeItem;
        
        _vest set [1, _cleanVestContent];
    };

    private _backpack = _loadout#5;
    if (_backpack isNotEqualTo []) then
    {
        private _backpackContent = _backpack#1;
        private _cleanBackpackContent = [_backpackContent, _itemName] call _removeItem;
        
        _backpack set [1, _cleanBackpackContent];
    };
    
} forEach _loadoutVariants;
