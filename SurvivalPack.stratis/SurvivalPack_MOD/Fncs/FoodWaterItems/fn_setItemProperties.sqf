params ["_itemName","_foodValue","_waterValue","_consumeDuration"];

// get item index
private _item_index = sp_definedItems find _itemName;
if (_item_index == -1) exitWith {systemChat format ["SurvivalPack\fn_setItemProperties: error item '%1' doesn't exist", _itemName]};

// get item info
private _itemInfo = sp_definedItemInfos select _item_index;

// get item name & item use code & item params
_itemInfo params ["_item_name","_item_useCode","_item_params"];

// set values
_item_params set [0, _foodValue];
_item_params set [1, _waterValue];
_item_params set [4, _consumeDuration];

_itemInfo set [2, _item_params];

sp_definedItemInfos set [_item_index, _itemInfo];
publicVariable "sp_definedItemInfos";