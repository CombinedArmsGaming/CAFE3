
params ["_namesIn", "_objectUid"];

_forename = "";
_surname = "";

switch (typeName _namesIn) do
{
    case ("STRING"):
    {
        _names = configfile >> "CfgWorlds" >> "GenericNames" >> _namesIn;

        if (isNull _names) then
        {
            _names = configfile >> "CfgWorlds" >> "GenericNames" >> "Default";
        };

        _forenames = _names >> "FirstNames";
        _surnames = _names >> "LastNames";

        _count = count _forenames;
        _name = _forenames select (floor (_objectUid random _count));
        _forename = getText _name;

        _objectUid = _objectUid * 2;

        _count = count _surnames;
        _name = _surnames select (floor (_objectUid random _count));
        _surname = getText _name;

    };

    case ("ARRAY"):
    {
        _forenames = _namesIn#0;
        _surnames = _namesIn#1;

        _forename = _forenames select (floor (_objectUid random (count _forenames)));
        _objectUid = _objectUid * 2;
        _surname = _surnames select (floor (_objectUid random (count _surnames)));

    };

};

[(_forename + " " + _surname), _forename, _surname]
