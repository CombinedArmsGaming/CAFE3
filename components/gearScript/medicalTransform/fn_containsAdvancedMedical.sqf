params ["_container"];


_advMedicalTypes = ["ACE_elasticBandage", "ACE_packingBandage", "ACE_tourniquet", "ACE_atropine", "ACE_adenosine"];
_foundAdvMedical = false;


{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _advMedicalTypes}}) exitWith
    {
        _foundAdvMedical = true;
    }

} forEach _container;


_foundAdvMedical
