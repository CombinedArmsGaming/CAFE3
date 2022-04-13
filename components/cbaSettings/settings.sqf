/* --------------------------------------------------------------------------------------------------------------------
	Author:	Joecuronium
	Description:
		This file stores the presets for forcing mission-addon settings
-------------------------------------------------------------------------------------------------------------------- */

#include "..\..\configuration\cbaSettings.hpp"

//Medical

//Advanced 80% slower reopening

#ifdef CA_MEDICAL_ADVANCED_80

	#include "medical_advanced_80.sqf"

#endif

//Advanced 95% reopening

#ifdef CA_MEDICAL_ADVANCED_95

	#include "medical_advanced_95.sqf"

#endif

//Basic no reopening

#ifdef CA_MEDICAL_BASIC

	#include "medical_basic.sqf"

#endif


//Spectate

//Limited

#ifdef CAFE_SPECTATE_LIMITED

	#include "spectate_limited.sqf"

#endif

//Full

#ifdef CAFE_SPECTATE_FULL

	#include "spectate_full.sqf"

#endif


//Logistics

#ifdef CAFE_LOGISTICS

	#include "logistics_settings.sqf"

#endif

//ACRE

#ifdef DISABLE_ACRE_TERRAIN_LOSS

	#include "acre_settings.sqf"

#endif

//ACE Adv. Car Damage

#ifdef DISABLE_ACE_CAR_DAMAGE

	#include "ace_vic_settings.sqf"

#endif
