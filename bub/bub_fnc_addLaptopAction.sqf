params ["_laptop"];

_onLaptopInvestigate = 
{
	params ["_target", "_caller"];

	[[], "bub\bub_vm_cl_showLaptopText.sqf"] remoteExec ["execVM", _caller];
	
};



if (isServer) then
{
	[
		_laptop, 
		
		[
			"<t color='#FFFFFF'>Investigate Commander's Laptop</t>
	<br/>
	<t color='#AAAAAA'>Still open, showing emails.</t>",

			_onLaptopInvestigate,
			nil, 
			6, 
			true, 
			true, 
			"", 
			"true", 
			2
		]
		
	] remoteExec ["addAction", 0];
};