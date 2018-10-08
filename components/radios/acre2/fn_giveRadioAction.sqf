
_x = _this;
_unit = player;

//Give the player a message so it isn't forgotten about during the briefing.
[_x] spawn
{
    waitUntil { time > 3 };
    systemChat format["[F3 ACRE2] Warning: No room to add radio '%1', report this to the mission maker. You now have a scroll-wheel action to get this radio.",_this select 0];

};

//Create addAction to give radio.
_radioName = getText (configfile >> "CfgWeapons" >> _x >> "displayName");

_actionText = format ["<t color='#3375D6'>[Radios] Give myself an %1 radio</t>", _radioName];

_actionFnc =
{
    _radioToGive = (_this select 3) select 0;
    _unit = (_this select 0);

    if (_unit canAdd _radioToGive) then
    {
       _unit addItem _radioToGive;
       _unit removeAction (_this select 2);
    }
    else
    {
        systemChat format ["[F3 ACRE2] Warning: No room to add radio '%1', remove more stuff and try again", _radioToGive];
    };

};

_actionID = _unit addAction [_actionText, _actionFnc, [_x], 0, false, false, "", "(_target == _this)"];

[_actionID,_unit] spawn
{
    sleep 300;

    if (!isNull (_this select 1)) then
    {
        (_this select 1) removeAction (_this select 0);

    };

};
