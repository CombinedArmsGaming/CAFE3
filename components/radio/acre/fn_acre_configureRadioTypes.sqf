// ACRE integration for CAFE, by Bubbus
// BUB 2023-03-22 TODO :: Check net groupings below.  Can't find docs for this.

f_map_radioTypes = createHashMapFromArray
[
	["ACRE_PRC343",  "Short Range"],
	["ACRE_PRC152",  "Long Range"],
	["ACRE_PRC148",  "Long Range"],
	["ACRE_PRC117F", "Long Range"],
	["ACRE_PRC77",   "Long Range"],
	["ACRE_SEM70",   "Long Range"],
	["ACRE_SEM52SL", "Long Range"],
	["ACRE_BF888S",  "Baofeng"]
];

f_map_radioTypesInverse = createHashMapFromArray
[
	["Short Range", ["ACRE_PRC343"]],
	["Long Range",  ["ACRE_PRC152", "ACRE_PRC148", "ACRE_PRC117F", "ACRE_PRC77", "ACRE_SEM70", "ACRE_SEM52SL"]],
	["Baofeng", 	["ACRE_BF888S"]]
];