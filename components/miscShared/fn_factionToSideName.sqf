
params ["_faction"];

private _identity = _faction;

_faction = toLower _faction;	// "in" compares case-sensitive, meaning {"BLU_F" in ["blu_f"]} returns false.

if (_faction in ["blu_f", "blu_t_f", "blu_ctrg_f", "blu_gen_f", "b_macv"]) then
{
    _identity = "blufor";
};

if (_faction in ["opf_f", "opf_t_f", "o_pavn"]) then
{
	_identity = "opfor";
};

if (_faction in ["ind_f", "ind_c_f", "i_arvn"]) then
{
    _identity = "indfor";
};

if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then
{
    _identity = "guerrilla";
};

if (_faction in ["civ_f","civ_idap_f"]) then
{
    _identity = "civilian";
};


_identity
