#include "../macros.hpp"

params ["_display"];

_subtitle = _display displayCtrl IDC_RESPAWNTITLE_INFOTEXT;
_text = "";

_squad = group player;
_squadName = groupId _squad;

if (_squadName isEqualTo "Reinforcements") then
{
    _text = "<t align=""center"" size=""0.9"">You are a part of the <t font=""PuristaBold"">""Reinforcements""</t> squad.<br/><br/>You can re-join or re-create your old squad<br/>by using the <t font=""PuristaBold"">""CA Squad Actions""</t> ACE self-interact option.</t>";
}
else
{
    _template = "<t align=""center"" size=""0.9"">You are a part of the respawn squad <t font=""PuristaBold"">""%1"".</t><br/><br/>You can re-join or re-create your old squad<br/>by using the <t font=""PuristaBold"">""CA Squad Actions""</t> ACE self-interact option.</t>";
    _text = format [_template, _squadName];
};

_subtitle ctrlSetStructuredText parseText _text;
