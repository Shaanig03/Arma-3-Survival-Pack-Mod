params ["_itemClass", ["_container", "u"]];

// exit if player is already performing an action
private _inaction = player getVariable ["sp_inaction", false];
if (_inaction) exitWith {systemChat sp_msg_alreadyInAction};

// get item info 
private _itemInfo2Index = (sp_definedItems find _itemClass);

// exit if item info isn't found
if (_itemInfo2Index == -1) exitWith {};
private _itemInfo2 = sp_definedItemInfos select _itemInfo2Index;
if (isNil {_itemInfo2}) exitWith {};

// get item displayName
//-----------------------------------------
private _itemDisplayName = getText(configfile >> "CfgWeapons" >> _itemClass >> "displayName");
private _itemClassType = _itemClass call BIS_fnc_itemType;
_itemClassType params ["_itemCategory"];


switch(_itemCategory) do {
	case "Magazine": {
		_itemDisplayName = getText(configfile >> "CfgMagazines" >> _itemClass >> "displayName");
	};
	case "Mine": {
		_itemDisplayName = getText(configfile >> "CfgMagazines" >> _itemClass >> "displayName");
	};
	default {};
};


_itemInfo2 params ["_itemType","_useCode"];

[player, _itemClass, _container, _itemInfo2] spawn _useCode;
//-----------------------------------------

