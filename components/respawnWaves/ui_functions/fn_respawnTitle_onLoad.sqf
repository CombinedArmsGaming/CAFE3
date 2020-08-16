#include "../macros.hpp"

params ["_display"];

_subtitle = _display displayCtrl IDC_RESPAWNTITLE_INFOTEXT;
_text = "";

_squadMode = f_var_respawnTitle_squadMode;
_targetSquad = f_var_respawnTitle_targetSquad;

_text = switch (_squadMode) do
{
    case ("RespawnSquad"):
    {
        _template = "<t align=""center"" size=""0.9"">You will be joined to the new respawn-squad <t font=""PuristaBold"">""%1"".</t><br/><br/>You can re-join or re-create your old squad<br/>by using the <t font=""PuristaBold"">""CA Squad Actions""</t> ACE self-interact option.</t>";
        format [_template, _targetSquad]
    };
    case ("OriginalSquad"):
    {
        _template = "<t align=""center"" size=""0.9"">You will be auto-joined to your previous squad <t font=""PuristaBold"">""%1""</t>.<br/><br/>You can create or join a different squad<br/>by using the <t font=""PuristaBold"">""CA Squad Actions""</t> ACE self-interact option.</t>";
        format [_template, _targetSquad]
    };
    case ("Error"):
    {
        "<t align=""center"" size=""0.9"">A squad could not be automatically found for you.<br/><br/>You can create a new squad or join an existing one<br/>by using the <t font=""PuristaBold"">""CA Squad Actions""</t> ACE self-interact option.</t>"
    };
};

_subtitle ctrlSetStructuredText parseText _text;
