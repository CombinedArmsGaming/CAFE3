
// Internal function for use by the kill-log viewer.  Do not call this manually in the editor.

if (isNil 'f_var_mapDrawHandlerId') then
{
	f_var_mapDrawHandlerId = (findDisplay 313 displayCtrl 51) ctrlAddEventHandler
	[
		"Draw",
		{
			if (isNil 'f_var_mapDrawHandlerId') exitWith {};

			_map = _this select 0;

			{
				_map drawLine _x;

			} forEach f_var_killerMapLines;

		}

	];

};
