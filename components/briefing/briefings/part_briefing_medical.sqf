
// BUB 2018-11-30 TODO :: Match these up with config instead of code dupe.

_medLevel               = switch (ace_medical_level)                        do { case 1: { "Basic" }; case 2: { "Advanced" }; default { "Unknown" }; };
_medAiUnconsciousness   = switch (ace_medical_enableunconsciousnessai)      do { case 0: { "Disabled" }; case 1: { "50/50" }; case 2: { "Enabled" }; default { "Unknown" }; };
_medPreventInsta        = switch (ace_medical_preventinstadeath)            do { case false; case 0: { "Disabled" }; case true; case 1: { "Enabled" }; default { "Unknown" }; };
_medPainReturns         = switch (ace_medical_painisonlysuppressed)         do { case false; case 0: { "Disabled" }; case true; case 1: { "Enabled" }; default { "Unknown" }; };
_medHealBandaged        = switch (ace_medical_healhitpointafteradvbandage)  do { case false; case 0: { "Disabled" }; case true; case 1: { "Enabled" }; default { "Unknown" }; };
_medReopeningWounds     = switch (ace_medical_enableadvancedwounds)         do { case false; case 0: { "Disabled" }; case true; case 1: { "Enabled" }; default { "Unknown" }; };
_medWhoCanEpi           = switch (ace_medical_medicsetting_basicepi)        do { case 0: { "Anyone" }; case 1: { "Medics only" }; case 2: { "Doctors only" }; default { "Unknown" }; };
_medWhoCanPak           = switch (ace_medical_medicsetting_pak)             do { case 0: { "Anyone" }; case 1: { "Medics only" }; case 2: { "Doctors only" }; default { "Unknown" }; };
_medWhoCanSurgical      = switch (ace_medical_medicsetting_surgicalkit)     do { case 0: { "Anyone" }; case 1: { "Medics only" }; case 2: { "Doctors only" }; default { "Unknown" }; };
_medReviveEnabled       = switch (ace_medical_enablerevive)                 do { case 0: { "Disabled" }; case 1: { "Enabled" }; default { "Unknown" }; };
_medReviveLives         = switch (ace_medical_amountofrevivelives)          do { case -1: { "Unlimited" }; default { str ace_medical_amountofrevivelives }; };
_medPainMul             = str ace_medical_paincoefficient;
_medBleedMul            = str ace_medical_bleedingcoefficient;
_medMenuMaxRange        = str ace_medical_menu_maxrange;
_medReviveTimer         = str ace_medical_maxrevivetime;


_briefing = "";
_briefing = _briefing + "
<font size='20'>Medical settings:</font><br/>
<br/>
Medical level: <b>" + _medLevel + "</b><br/>
<br/>
Pain multiplier: " + _medPainMul + "x<br/>
Bleed multiplier: " + _medBleedMul + "x<br/>
<br/>
Prevent insta-death: " + _medPreventInsta + "<br/>
Revive-state: " + _medReviveEnabled + "<br/>";

if (ace_medical_enablerevive == 1) then
{
_briefing = _briefing +
"Revive timer: " + _medReviveTimer + "s<br/>
Revive lives: " + _medReviveLives + "<br/>"
};

_briefing = _briefing + "
<br/>
Who can use epi: " + _medWhoCanEpi + "<br/>
Who can use PAKs: " + _medWhoCanPak + "<br/>
Who can use Surgical Kits: " + _medWhoCanSurgical + "<br/>
<br/>
Heal bandaged HP: " + _medHealBandaged + "<br/>
Re-opening wounds: " + _medReopeningWounds + "<br/>
Pain returns over time: " + _medPainReturns + "<br/>
<br/>
Medical menu max range: " + _medMenuMaxRange + "m<br/>
AI unconsciousness: " + _medAiUnconsciousness + "<br/>
";
// ====================================================================================

// CREATE DIARY ENTRY

player createDiaryRecord ["diary", ["Medical Settings",_briefing]];

// ====================================================================================
