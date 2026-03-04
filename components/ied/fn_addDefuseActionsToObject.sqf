/**
	By JC (docs/minor edit by Bubbus)
	Adds three ACE actions to the given object:
		* Defuse Power Source
		* Defuse Initiator
		* Defuse Detonator
	These actions are linked in order - failure to complete in order will lead to big kaboom.
 */
params ["_object", "_isLarge"];

// All stages - on failure, detonate the IED.
private _failed = 
{
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];

	private _bomb = _args # 0;
	private _isLarge = _args # 1;

	[_bomb, _isLarge] call f_fnc_iedBoom;
};


// 'Defuse power source' stage
private _condition_power = 
{
	private _canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	private _isDefused = _target getVariable ["defused_power", false];

	(_canDefuse and !_isDefused)
};

private _statement_power = 
{
    params ["_target", "_player", "_params"];

	private _finish_code = _params select 0;
	private _failed_code = _params select 1;
	private _isLarge = _params select 2;

	[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Power Source..."] call ace_common_fnc_progressBar;
};

private _finish_power = 
{
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];

	private _bomb = _args # 0;
	_bomb setVariable ["defused_power", true, true];
};

private _action_power = ["Defuse Power Source", "Defuse Power Source", "", _statement_power, _condition_power, {}, [_finish_power, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_power] call ace_interact_menu_fnc_addActionToObject;


// 'Defuse initiator' stage
private _condition_init = 
{
	private _canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	private _isDefused = _target getVariable ["defused_init", false];

	(_canDefuse and !_isDefused)
};

private _statement_init = 
{
    params ["_target", "_player", "_params"];

	private _finish_code = _params # 0;
	private _failed_code = _params # 1;
	private _isLarge = _params # 2;
	private _previousStepDone = _target getVariable ["defused_power", false];

	if (_previousStepDone == false) then 
	{
		_target setDamage 1;
	} 
	else 
	{
		[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Initiator..."] call ace_common_fnc_progressBar;
	};
};

private _finish_init = 
{
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];

	private _bomb = _args select 0;
	_bomb setVariable ["defused_init", true, true];
};

private _action_init = ["Defuse Initiator", "Defuse Initiator", "", _statement_init, _condition_init, {}, [_finish_init, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_init] call ace_interact_menu_fnc_addActionToObject;


// 'Defuse detonator' stage
private _condition_det = 
{
	private _canDefuse = [_player, "ACE_DefusalKit" ] call BIS_fnc_hasItem;
	private _isDefused = _target getVariable ["defused", false];
	
	(_canDefuse and !_isDefused)
};

private _finish_det = 
{
	params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];

	private _bomb = _args select 0;
	_bomb setVariable ["defused", true, true];
};

private _statement_det = 
{
    params ["_target", "_player", "_params"];

	private _finish_code = _params select 0;
	private _failed_code = _params select 1;
	private _isLarge = _params select 2;
	private _previousStepDone = _target getVariable ["defused_init", false];

	if (_previousStepDone == false) then
	{
		_target setDamage 1;
	}
	else
	{
		[60, [_target, _isLarge], _finish_code, _failed_code, "Defusing Detonator..."] call ace_common_fnc_progressBar;
	};
};

private _action_det = ["Defuse Detonator", "Defuse Detonator", "", _statement_det, _condition_det, {}, [_finish_det, _failed, _isLarge]] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action_det] call ace_interact_menu_fnc_addActionToObject;
