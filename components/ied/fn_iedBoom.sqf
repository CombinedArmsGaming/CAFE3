params ["_object", "_isLarge"];

_isDefused = _object getVariable ["defused", false];

if (_isDefused == false) then 
{
    if (_isLarge == true) then 
    {
        private _explosive1 = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (getPos _object);
        _explosive1 setDamage 1;

        private _explosive2 = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (getPos _object);
        _explosive2 setDamage 1;

        private _explosive3 = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (getPos _object);
        _explosive3 setDamage 1;
    } 
    else 
    {
        private _explosive = "DemoCharge_Remote_Ammo_Scripted" createVehicle (getPos _object);
        _explosive setDamage 1;
    };
};