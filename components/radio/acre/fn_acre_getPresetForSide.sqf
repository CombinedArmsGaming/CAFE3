params ["_side"];

switch (_side) do
{
    case west: 		 {f_var_acre_bluforRadioNet};
    case east: 		 {f_var_acre_opforRadioNet};
    case resistance: {f_var_acre_indforRadioNet};
    case civilian: 	 {f_var_acre_civRadioNet};
    default 		 {"default"};
}