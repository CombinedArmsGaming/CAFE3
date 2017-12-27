params ["_floater"];


_onReleaseClamps = 
{
	params ["_floater", "_caller", "_actionId"];

	[[_floater, _caller, _actionId], "bub\bub_vm_sv_releaseVehicleClamps.sqf"] remoteExec ["execVM", _caller];
	
};


[
	_floater, 
	
	[
		"<t color='#FFFFFF'>Release vehicle clamps</t>
<br/>
<t color='#AAAAAA'>(only use when beached)</t>", 
		_onReleaseClamps,
		nil, 
		6, 
		false, 
		true, 
		"", 
		'driver _target == _this;', 
		15
	]
	
] remoteExec ["addAction", 0];


		