[] spawn 
{
	if (isDedicated) exitWith {};
	
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [ 6 ];
	"dynamicBlur" ppEffectCommit 0.1;     

	titleText [" ", "WHITE OUT", 0.1];
	
	playSound3d ["WW2\Assets_s\Weapons\SoundFrameWork_s\tails\cannon\Forest_close_2.wss", player, false, getPos player, 5, 2];
	sleep 0.1;
	playSound3d ["WW2\Assets_s\Weapons\SoundFrameWork_s\tails\cannon\Forest_close_2.wss", player, false, getPos player, 5, 0.5];
	
	sleep 1;
	
	titleText [" ", "WHITE IN", 6];
	
	"dynamicBlur" ppEffectAdjust [ 0 ];  
	"dynamicBlur" ppEffectCommit 10;
	
	sleep 10;
	"dynamicBlur" ppEffectEnable false;   
	
	["OPERATION FLASHBACK", "Omaha Beach", "12/08/1940"] spawn BIS_fnc_infoText; 
		
};
