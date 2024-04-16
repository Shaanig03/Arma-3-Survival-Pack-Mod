params ["_itemName","_itemInfo"]; // (string) item name, (array) item info

if (isNil "sp_definedItems") then {sp_definedItems = []};
if (isNil "sp_definedItemInfos") then {sp_definedItemInfos = []};

sp_definedItems pushBack _itemName;
sp_definedItemInfos pushBack _itemInfo;

publicVariable "sp_definedItems";
publicVariable "sp_definedItemInfos";