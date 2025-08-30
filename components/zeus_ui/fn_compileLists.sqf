/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Compiles the categories, units and the presets lists, and saves the results to the mission namespace for
		later use.
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"
#include "macros.hpp"


private _getClassName = {
	params ["_config"];

	// str _config returns the 'path' to the class name
	// This regex pattern searches for the class name at the end of a string, starting with a / or \
	// It returns an array [[[matching string, index]]], so select just the string
	private _resultArray = ((str (_config)) regexFind ["(?<=[\/ \\])[A-Za-z0-9_]+$"]);
	if (count _resultArray == 0) then {
		private _str = format ["[ZeusUI] ERROR: Could not find class name from config string %1", str _config];
		systemChat _str;
		diag_log _str;
		// Return empty string
		"";
	} else {
		DEBUG_FORMAT1_LOG("[ZEUS_UI] Compile list found class name %1", toLower (((_resultArray # 0) # 0) # 0));
		toLower (((_resultArray # 0) # 0) # 0);
	};
};


// Set up some variables
private _createNamespace = {createLocation ["NameVillage", [0,0,0], 0, 0]};

// Create a namespace for all categories
private _allCategoriesNamespace = call _createNamespace;
private _allCategoriesVars = [];
private _allCategoryClassNames = [];

// Iterate through the categories
{
	// Remember the config path to the category
	private _categoryConfig = _x;

	// Create a namespace for this category
	private _categoryNamespace = call _createNamespace;
	private _categoryVars = [];
	private _allUnitClassNames = [];

	// Fetch the category's settings
	private _categoryClassName = [_x] call _getClassName;
	private _categoryName = [_x, "categoryName", ""] call BIS_fnc_returnConfigEntry;
	private _categoryGear = [_x, "gear", ""] call BIS_fnc_returnConfigEntry;
	private _categorySide = [_x, "side", ""] call BIS_fnc_returnConfigEntry;

	// Determine the side based on the string
	switch (toLower _categorySide) do {
		case "west": {_categorySide = west};
		case "east": {_categorySide = east};
		case "resistance": {_categorySide = resistance};
		case "civilian": {_categorySide = civilian};
		default {_categorySide = sideUnknown};		// Fallback for incorrect side inputs
	};

	// Iterate through the unit classes inside this category
	{
		// Create a namespace for the unit
		private _unitNamespace = call _createNamespace;

		// Fetch the data from this unit entry
		private _unitClassName = [_x] call _getClassName;
		private _unitName = [_x, "unitName", ""] call BIS_fnc_returnConfigEntry;
		private _unitVehicle = [_x, "vehicle", ""] call BIS_fnc_returnConfigEntry;
		private _unitRoles = [_x, "units", []] call BIS_fnc_returnConfigEntry;
		private _reinforcementRoles = [_x, "reinforcements", []] call BIS_fnc_returnConfigEntry;
		private _groups = [_x, "groups", []] call BIS_fnc_returnConfigEntry;

		// Fill the data of the namespace
		_unitNamespace setVariable [MACRO_VARNAME_CLASS_NAME, _unitClassName];
		_unitNamespace setVariable [MACRO_VARNAME_UNIT_ROLES, _unitRoles];
		_unitNamespace setVariable [MACRO_VARNAME_REINFORCEMENT_ROLES, _reinforcementRoles];
		_unitNamespace setVariable [MACRO_VARNAME_UNIT_VEHICLE, _unitVehicle];
		_unitNamespace setVariable [MACRO_VARNAME_UNIT_GROUPS, _groups];

		// Save the unit namespace
		_categoryVars pushBack _unitName;
		_allUnitClassNames pushBack _unitClassName;
		_categoryNamespace setVariable [_unitName, _unitNamespace];

	} forEach configProperties [_categoryConfig, "isClass _x", false];

	// Fill the category namespace with data
	_categoryNamespace setVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, _categoryVars];
	_categoryNamespace setVariable [MACRO_VARNAME_NAMESPACE_ALLCLASSNAMES, _allUnitClassNames];
	_categoryNamespace setVariable [MACRO_VARNAME_CATEGORY_GEAR, _categoryGear];
	_categoryNamespace setVariable [MACRO_VARNAME_CATEGORY_SIDE, _categorySide];
	_categoryNamespace setVariable [MACRO_VARNAME_CLASS_NAME, _categoryClassName];

	// Save the category namespace
	_allCategoriesVars pushBack _categoryName;
	_allCategoryClassNames pushBack _categoryClassName;
	_allCategoriesNamespace setVariable [_categoryName, _categoryNamespace];

} forEach configProperties [missionConfigFile >> "CA_ZeusUI_Units", "isClass _x", false];





// Next, compile the AI presets
// Create a namespace for all presets
private _allPresetsNamespace = call _createNamespace;
private _allPresetsVars = [];

// Iterate through the presets
{
	// Remember the config path to the preset
	private _presetConfig = _x;

	// Create a namespace for this preset
	private _presetNamespace = call _createNamespace;

	// Fetch the preset's settings
	private _presetName = [_x, "presetName", ""] call BIS_fnc_returnConfigEntry;
	private _enableAdvancedAI = (([_x, "enableAdvancedAI", 0] call BIS_fnc_returnConfigEntry) > 0);

	// Check if this preset uses guerrilla AI
	private _guerrillaAI = false;
	if (isClass (_x >> "GuerrillaAI")) then {

		// Fetch the data from the guerrilla AI class
		_guerrillaAI = [];
		{
			// Fetch the variable name and the associated value
			private _varName = configName _x;
			private _value = [_presetConfig >> "GuerrillaAI", _varName, 0] call BIS_fnc_returnConfigEntry;

			switch (toLower _varName) do {
				case "flankonly": {
					_guerrillaAI set [0, (_value > 0)];
				};
				case "maxapproachvariation": {
					_guerrillaAI set [1, _value];
				};
				case "minapproachdistance": {
					_guerrillaAI set [2, _value];
				};
				case "maxapproachdistance": {
					_guerrillaAI set [3, _value];
				};
				case "maxsearchduration": {
					_guerrillaAI set [4, _value];
				};
				case "searchareasize": {
					_guerrillaAI set [5, _value];
				};
			};
		} forEach configProperties [_x >> "GuerrillaAI", "!isClass _x", false];
	};

	// Check if this preset uses suppressive AI
	private _suppressiveAI = false;
	if (isClass (_x >> "SuppressiveAI")) then {

		// Fetch the data from the suppressive AI class
		_suppressiveAI = [];
		{
			// Fetch the variable name and the associated value
			private _varName = configName _x;
			private _value = [_presetConfig >> "SuppressiveAI", _varName, 0] call BIS_fnc_returnConfigEntry;

			switch (toLower _varName) do {
				case "suppressionmultiplier": {
					_suppressiveAI set [0, _value];
				};
				case "suppressiondurationmultiplier": {
					_suppressiveAI set [1, _value];
				};
				case "useanims": {
					_suppressiveAI set [2, (_value > 0)];
				};
			};
		} forEach configProperties [_x >> "SuppressiveAI", "!isClass _x", false];
	};

	// Fill the preset namespace with data
	_presetNamespace setVariable [MACRO_VARNAME_PRESET_GAI, _guerrillaAI];
	_presetNamespace setVariable [MACRO_VARNAME_PRESET_SAI, _suppressiveAI];
	_presetNamespace setVariable [MACRO_VARNAME_PRESET_ADVANCEDAI, _enableAdvancedAI];

	// Save the preset namespace
	_allPresetsVars pushBack _presetName;
	_allPresetsNamespace setVariable [_presetName, _presetNamespace];

} forEach configProperties [missionConfigFile >> "CA_ZeusUI_AI_Presets", "isClass _x", false];





// Save the categories namespace
missionNamespace setVariable [MACRO_VARNAME_NAMESPACE_CATEGORIES, _allCategoriesNamespace, false];
_allCategoriesNamespace setVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, _allCategoriesVars];
_allCategoriesNamespace setVariable [MACRO_VARNAME_NAMESPACE_ALLCLASSNAMES, _allCategoryClassNames];

// Save the presets namespace
missionNamespace setVariable [MACRO_VARNAME_NAMESPACE_PRESETS, _allPresetsNamespace, false];
_allPresetsNamespace setVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, _allPresetsVars];

// Wrap up
missionNamespace setVariable [MACRO_VARNAME_UI_LISTSCOMPILED, true, false];
