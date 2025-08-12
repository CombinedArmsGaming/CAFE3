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
		// spawnHistoryQueue is the list of unitNames that have recursively been spawned in this ui_spawn event
		//		It works as a queue where a child unit adds itself to the queue, and removes itself when it is done spawning all of its children
		//		This allows checking for recursion
		params ["_categoryIndex", "_unitIndex", "_presetIndex", ["_unitsSpawned", 0], ["_spawnHistoryQueue", []]];

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
					private _spawnOffsetDistance = -10;

					_dir = getDir curatorCamera;
					// Get the normalized vector of the direction the units spawn in
					private _dirVector = [sin _dir, cos _dir, 0];
					
					// Shift the starting pos to account for previously spawned groups
					_pos = _pos vectorAdd (_dirVector vectorMultiply (_spawnOffsetDistance * _unitsSpawned));
					
					// Spawn any units, vehicles, reinforcements
					if (!(_roles isEqualTo [])) then {
						// Tell the server to spawn the group
						[_roles, _pos, _gear, _side, _vehicleClass, _enableAdvancedAI, _guerrillaAI, _suppressiveAI, _reinforcementRoles, _dir] remoteExec ["f_fnc_server_spawnGroup", 2, false];
						// Shift the spawn position, just in case more groups will be spawned.
						_pos = _pos vectorAdd (_dirVector vectorMultiply _spawnOffsetDistance);
						_unitsSpawned = _unitsSpawned + 1;
					};

					// Spawn any groups. Not an else clause so that units[] and groups[] will both be spawned.
					if (!(_groups isEqualTo [])) then {
						{
							// If this group is an array, then it is a list of units to be spawned
							if (typeName _x == "ARRAY") then {
								// Ignore vehicle and reinforcements. Those should be spawned via regular units, not via groups.
								[_x, _pos, _gear, _side, "", _enableAdvancedAI, _guerrillaAI, _suppressiveAI, [], _dir] remoteExec ["f_fnc_server_spawnGroup", 2, false];
								// Shift the spawn position by the spawn offset distance for each group
								_pos = _pos vectorAdd (_dirVector vectorMultiply _spawnOffsetDistance);
								_unitsSpawned = _unitsSpawned + 1;
							// Otherwise, it is the name of another unit
							} else {
								// Get the name of this unit
								private _unitName = _categoryVars select _unitIndex;

								// Save the name of the subunit to be spawned
								private _subUnitName = _x;

								// Find the index of that subunit
								_subUnitIndex = _categoryVars findIf {_x == _subUnitName};

								// It is fine to continue here because the -1 will get caught at the top of _spawnUnit
								if (_subUnitIndex == -1) then {
									private _str = format ["[ZeusUI] ERROR: Could not find unit with name %1 for spawning.", _unitName];
									systemChat _str;
									hint _str;
									diag_log _str;
								};

								// Check the spawn history queue to see if a parent of this unit is the same unit
								if ((_spawnHistoryQueue findIf {_x == _unitName}) != -1) then {
									private _str = format ["[ZeusUI] ERROR: Infinite recursion detected in spawning unit %1.", _unitName];
									systemChat _str;
									hint _str;
									diag_log _str;
								// If it wouldn't cause infinite recursion, do the spawning
								} else {
									// Add this unit to the spawn history
									_spawnHistoryQueue pushBack _unitName;
									
									// Recursively call to spawn anything (more groups, vehicles, etc.)
									[_categoryIndex, _subUnitIndex, _presetIndex, _unitsSpawned, _spawnHistoryQueue] call _spawnUnit;
									
									// Remove this unit from the spawn history as all of its children have finished spawning
									_spawnHistoryQueue deleteAt [-1];
								};
							};
						} forEach _groups;
					};
				};
			};
		};
	};

	[_categoryIndex, _unitIndex, _presetIndex] call _spawnUnit;
};
