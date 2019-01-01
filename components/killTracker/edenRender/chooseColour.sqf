_chooseColour =
{
	params ["_type", "_side"];

	_ret = "";

	if (_side == east and {toUpper _type isEqualTo "CIV"}) exitWith {"ColorCIV"};

	switch (_side) do
	{
		case west: {_ret = "ColorWEST";};
		case east: {_ret = "ColorEAST";};
		case sideUnknown: {_ret = "ColorCIV";};
		case CIVILIAN: {_ret = "ColorCIV";};
		case INDEPENDENT: {_ret = "ColorGUER";};
	};

	_ret
};
