// Spawn a unit
case "ui_spawn": {
	_eventExists = true;

	// Fetch our listbox indexes
	private _categoryIndex = missionNamespace getVariable [MACRO_VARNAME_UI_CATEGORYINDEX, -1];
	private _unitIndex = missionNamespace getVariable [MACRO_VARNAME_UI_UNITINDEX, -1];
	private _presetIndex = missionNamespace getVariable [MACRO_VARNAME_UI_PRESETINDEX, -1];

	// Function to spawn a unit to allow recursion. Called below.
	private _spawnUnit = {
		// unitsSpawned is the number of units already spawned in the same ui_spawn event
		params ["_categoryIndex", "_unitIndex", "_presetIndex", ["_unitsSpawned", 0]];

		// Only continue if we selected something in every listbox
		if (_categoryIndex >= 0 and {_unitIndex >= 0} and {_presetIndex >= 0}) then {

			// Fetch the selected category namespace
			private _allCategoriesNamespace = missionNamespace getVariable [MACRO_VARNAME_NAMESPACE_CATEGORIES, locationNull];
			private _allCategoriesVars = _allCategoriesNamespace getVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, []];
			private _categoryNamespace = _allCategoriesNamespace getVariable [_allCategoriesVars select _categoryIndex, locationNull];

			// Fetch the selected unit namespace
			private _categoryVars = _categoryNamespace getVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, []];
			private _unitNamespace = _categoryNamespace getVariable [_categoryVars select _unitIndex, locationNull];

			// Fetch the gear and side
			private _gear = _categoryNamespace getVariable [MACRO_VARNAME_CATEGORY_GEAR, ""];
			private _side = _categoryNamespace getVariable [MACRO_VARNAME_CATEGORY_SIDE, sideUnknown];

			// Fetch the roles list and the vehicle (if we have one)
			private _roles = _unitNamespace getVariable [MACRO_VARNAME_UNIT_ROLES, []];
			private _reinforcementRoles = _unitNamespace getVariable [MACRO_VARNAME_REINFORCEMENT_ROLES, []];
			private _vehicleClass = _unitNamespace getVariable [MACRO_VARNAME_UNIT_VEHICLE, ""];
			private _groups = _unitNamespace getVariable [MACRO_VARNAME_UNIT_GROUPS, []];

			// Only continue if we have valid data to spawn anything with
			if (!((_roles isEqualTo []) and (_groups isEqualTo [])) and {_gear != ""}) then {

				// If the side parameter in ca_units.hpp was not recognised, throw an error
				if (_side == sideUnknown) then {
					private _str = format ["[ZeusUI] ERROR: Couldn't determine a side for this spawn category (%1) - Please check 'ca_units.hpp' for spelling mistakes, or a missing side parameter.", _allCategoriesVars select _categoryIndex];
					systemChat _str;
					hint _str;
					diag_log _str;

				// Otherwise, carry on
				} else {
					// Fetch the spawn position
					private _pos = screenToWorld [0.5, 0.5];

					// Set up our preset variables
					private _enableAdvancedAI = false;
					private _guerrillaAI = false;
					private _suppressiveAI = false;

					// If the custom preset is selected, fetch the settings from the menu
					if (_presetIndex == 0) then {

						// If guerrilla AI is enabled, fetch its settings
						if (missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI, false]) then {
							_guerrillaAI = [
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_FLANKONLY, false],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_MAXAPPROACHVARIATION, 45],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_MINAPPROACHDISTANCE, 1000],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_MAXAPPROACHDISTANCE, 50],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_MAXSEARCHDURATION, 60],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_GAI_SEARCHAREASIZE, 30]
							];
						};

						// If suppressive AI is enabled, fetch its settings
						if (missionNamespace getVariable [MACRO_VARNAME_PRESET_SAI, false]) then {
							_suppressiveAI = [
								missionNamespace getVariable [MACRO_VARNAME_PRESET_SAI_SUPPRESSIONMUL, 1],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_SAI_SUPPRESSIONDURATIONMUL, 1],
								missionNamespace getVariable [MACRO_VARNAME_PRESET_SAI_USEANIMS, false]
							];
						};

						_enableAdvancedAI = missionNamespace getVariable [MACRO_VARNAME_PRESET_ADVANCEDAI, false];

					// Otherwise, fetch the selected preset
					} else {
						private _allPresetsNamespace = missionNamespace getVariable [MACRO_VARNAME_NAMESPACE_PRESETS, locationNull];
						private _allPresetsVars = _allPresetsNamespace getVariable [MACRO_VARNAME_NAMESPACE_ALLVARIABLES, []];
						private _presetNamespace = _allPresetsNamespace getVariable [_allPresetsVars select (_presetIndex - 1), locationNull];

						// Fetch the settings from the selected preset
						_enableAdvancedAI = _presetNamespace getVariable [MACRO_VARNAME_PRESET_ADVANCEDAI, false];
						_guerrillaAI = _presetNamespace getVariable [MACRO_VARNAME_PRESET_GAI, []];
						_suppressiveAI = _presetNamespace getVariable [MACRO_VARNAME_PRESET_SAI, []];
					};

					// Distance apart to spawn subsequent groups (negative = behind)
					private _spawnOffsetDistance = -5;

					_dir = getDir curatorCamera;
					// Get the normalized vector of the direction the units spawn in
					private _dirVector = [sin _dir, cos _dir, 0];
					
					// Shift the starting pos to account for previously spawned groups
					_pos = _pos vectorAdd (_dirVector vectorMultiply (_spawnOffsetDistance * _unitsSpawned));

					if (!(_roles isEqualTo [])) then {
						// Tell the server to spawn the group
						[_roles, _pos, _gear, _side, _vehicleClass, _enableAdvancedAI, _guerrillaAI, _suppressiveAI, _reinforcementRoles, _dir] remoteExec ["f_fnc_server_spawnGroup", 2, false];
						// Shift the spawn position, just in case more groups will be spawned.
						_pos = _pos vectorAdd (_dirVector vectorMultiply -5);
						_unitsSpawned = _unitsSpawned + 1;
					};

					if (!(_groups isEqualTo [])) then {
						{
							// If this group is an array, then it is a list of units to be spawned
							if (typeName _x == "ARRAY") then {
								// Ignore vehicle and reinforcements. Those should be spawned via regular units, not via groups.
								[_x, _pos, _gear, _side, "", _enableAdvancedAI, _guerrillaAI, _suppressiveAI, [], _dir] remoteExec ["f_fnc_server_spawnGroup", 2, false];
								// Shift the spawn position 5m back for each group
								_pos = _pos vectorAdd (_dirVector vectorMultiply -5);
								_unitsSpawned = _unitsSpawned + 1;
							// Otherwise, it is the name of another unit
							} else {
								// Save the name of the other unit to be spawned
								private _subUnitName = _x;
								// Find the index of that subunit
								_subUnitIndex = _categoryVars findIf {_x == _subUnitName};
								
								// Recursively call to spawn anything
								[_categoryIndex, _subUnitIndex, _presetIndex, _unitsSpawned] call _spawnUnit;
							};
						} forEach _groups;
					};
				};
			};
		};
	};

	[_categoryIndex, _unitIndex, _presetIndex] call _spawnUnit;
};
