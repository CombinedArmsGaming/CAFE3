
case "ui_notifier_refresh": {
	_eventExists = true;

	private _notifHashMap = missionNamespace getVariable [MACRO_VARNAME_NOTIFIER_MAP, false];
	if (_notifHashMap isEqualTo false) exitWith {
		private _str = "[ZEUS_NOTIFIER] Client: Notifier refresh event raised but notifier map does not exist.";
		DEBUG_PRINT_CHAT(_str);
		DEBUG_PRINT_LOG(_str);
	};

	systemChat format ["map: %1", _notifHashMap];
	DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: Received updated hashmap: %1", _notifHashMap);
	
};