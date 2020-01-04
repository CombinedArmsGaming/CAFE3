#define LOOTBOX_VAR(NAME) CONCAT(f_lootbox_,NAME)
#define LOOTBOX_VAR_DYNAMIC(NAME) (missionNamespace getVariable [format ["f_lootbox_%1", NAME], []])

#define WHITE 500
#define GREEN 100
#define BLUE 25
#define PURPLE 5
#define ORANGE 1

#define LOOT_BOX "lootBox"
#define LOOT_SINGLE "singleItem"
#define LOOT_MULTIPLE "multipleItems"
#define LOOT_GROUP "itemGroup"
#define LOOT_LIST "lootList"

#define ITEMTYPE_ITEM "normalItem"
#define ITEMTYPE_BACKPACK "backpack"

#define CREATE_LOOTBOX(NAME) LOOTBOX_VAR(NAME) = [LOOT_BOX, []]

// Single items, can be found in any loot construct
#define ITEM(ITEM) [LOOT_SINGLE, ITEM, ITEMTYPE_ITEM]
// Multiple identical items, quantity can be an integer or [min, max].
#define ITEMS(ITEM,QUANTITIES) [LOOT_MULTIPLE, ITEM, QUANTITIES, ITEMTYPE_ITEM]

// For when you want nothing to appear.
#define EMPTY() [LOOT_SINGLE, "", ITEMTYPE_ITEM]

// Single backpack, can be found in any loot construct
#define BACKPACK(ITEM) [LOOT_SINGLE, ITEM, ITEMTYPE_BACKPACK]
// Multiple identical backpacks, quantity can be an integer or [min, max] or [min, mid, max].
#define BACKPACKS(ITEM,QUANTITIES) [LOOT_MULTIPLE, ITEM, QUANTITIES, ITEMTYPE_BACKPACK]

#define ADD_TO_LOOTBOX(BOXNAME,ITEM) (LOOTBOX_VAR(BOXNAME) select 1) pushBack ITEM

// Different items grouped together.  For example, weapon grouped with ammo.  This is the base behaviour of a lootbox.
#define LOOTGROUP() [LOOT_GROUP, []]
#define ADD_TO_LOOTGROUP(GROUP,ITEM) (GROUP select 1) pushBack ITEM

// A list in which random objects are selected, based on rarity.
#define LOOTLIST(QUANTITIES) [LOOT_LIST, [], QUANTITIES]
#define ADD_TO_LOOTLIST(LIST,ITEM,RARITY) (LIST select 1) pushBack [ITEM, RARITY]
