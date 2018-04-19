params ["_dispenser", "_faction"];

_loadouts_opfor = [["Fireteam Lead", "ftl"], ["Medic", "med"], ["Autorifleman", "ar"], ["Assistant AR", "aar"], ["Light Anti-tank", "lat"], ["Marksman", "mk"], ["Pilot", "pilot"]];
_loadouts_blufor = [["Fireteam Lead", "ftl"], ["Medic", "med"], ["Autorifleman", "ar"], ["Assistant AR", "aar"], ["Light Anti-tank", "lat"], ["Marksman", "mk"]];

_chooseLoadoutFormattable = 
	'params ["_target", "_caller"];
	
	["%1", _caller, "%2"] call f_fnc_assignGear;';



if (isServer) then
{
	_loadouts = [];
	
	switch (toLower _faction) do
	{
		case "opf_f":
		{
			_loadouts = _loadouts_opfor;
		};
		
		case "blu_f":
		{
			_loadouts = _loadouts_blufor;
		};
		
	};

	{
		[
			_dispenser, 
			
			[
				format ["Pick loadout: '%1'", _x select 0],
				format [_chooseLoadoutFormattable, _x select 1, _faction],
				nil, 
				6, 
				true, 
				true, 
				"", 
				"true", 
				2
			]
			
		] remoteExec ["addAction", 0, true];
		
	} forEach _loadouts;
};