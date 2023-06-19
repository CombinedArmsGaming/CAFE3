params ["_originalLoadout"];

// Check for CBA extended loadout, wrap if bare loadout.
if (count _originalLoadout == 10) then
{
    [_originalLoadout, []]
}
else
{
    _originalLoadout
}