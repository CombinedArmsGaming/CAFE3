CREATE_LOOTBOX(weapons);

_alwaysPistol = ITEM("hgun_P07_F");

_rifleList = LOOTLIST(2);
ADD_TO_LOOTLIST(_rifleList,ITEM("arifle_MX_F"),WHITE);
ADD_TO_LOOTLIST(_rifleList,ITEM("arifle_MXC_F"),GREEN);
ADD_TO_LOOTLIST(_rifleList,ITEM("arifle_MX_SW_F"),GREEN);
ADD_TO_LOOTLIST(_rifleList,ITEM("arifle_MXM_F"),BLUE);
ADD_TO_LOOTLIST(_rifleList,ITEM("arifle_MX_GL_F"),BLUE);

_launcherList = LOOTLIST(2);
ADD_TO_LOOTLIST(_launcherList,EMPTY(),WHITE);
ADD_TO_LOOTLIST(_launcherList,ITEM("launch_NLAW_F"),GREEN);

ADD_TO_LOOTBOX(weapons,_alwaysPistol);
ADD_TO_LOOTBOX(weapons,_rifleList);
ADD_TO_LOOTBOX(weapons,_launcherList);
