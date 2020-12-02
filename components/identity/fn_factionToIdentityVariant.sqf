
params ["_faction"];

_identityVariant = _faction;


if (_faction in ["blu_f", "blu_t_f", "blu_ctrg_f", "blu_gen_f"]) then
{
    _identityVariant = "blufor";
};

if (_faction in ["opf_f", "opf_t_f"]) then
{
	_identityVariant = "limey";
};

if (_faction in ["ind_f", "ind_c_f"]) then
{
    _identityVariant = "indfor";
};

if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then
{
    _identityVariant = "guerrilla";
};

if (_faction in ["civ_f","civ_idap_f"]) then
{
    _identityVariant = "civilian";
};


_identityVariant
